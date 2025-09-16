const std = @import("std");
const schema = @import("schema.zig");

const json = std.json;
const testing = std.testing;
const Allocator = std.mem.Allocator;
const Value = json.Value;

fn parseBytesToValue(allocator: Allocator, bytes: []const u8) !json.Parsed(Value) {
    return json.parseFromSlice(Value, allocator, bytes, .{
        .duplicate_field_behavior = .use_last,
        .allocate = .alloc_always,
    });
}

fn valuesEqual(a: Value, b: Value) bool {
    switch (a) {
        .null => return b == .null,
        .bool => |lhs| return switch (b) {
            .bool => |rhs| lhs == rhs,
            else => false,
        },
        .integer => |lhs| return numbersEqual(@as(f64, @floatFromInt(lhs)), b),
        .float => |lhs| return numbersEqual(lhs, b),
        .number_string => |lhs| {
            const parsed = parseNumberString(lhs) catch return false;
            return numbersEqual(parsed, b);
        },
        .string => |lhs| return switch (b) {
            .string => |rhs| std.mem.eql(u8, lhs, rhs),
            else => false,
        },
        .array => |lhs| return switch (b) {
            .array => |rhs| arraysEqual(lhs.items, rhs.items),
            else => false,
        },
        .object => |lhs| return switch (b) {
            .object => |rhs| objectsEqual(lhs, rhs),
            else => false,
        },
    }
}

fn numbersEqual(lhs: f64, value: Value) bool {
    switch (value) {
        .integer => |rhs| return lhs == @as(f64, @floatFromInt(rhs)),
        .float => |rhs| return lhs == rhs,
        .number_string => |rhs| {
            const parsed = parseNumberString(rhs) catch return false;
            return lhs == parsed;
        },
        else => return false,
    }
}

fn parseNumberString(text: []const u8) !f64 {
    return std.fmt.parseFloat(f64, text);
}

fn arraysEqual(a: []Value, b: []Value) bool {
    if (a.len != b.len) return false;
    var i: usize = 0;
    while (i < a.len) : (i += 1) {
        if (!valuesEqual(a[i], b[i])) return false;
    }
    return true;
}

fn objectsEqual(a: json.ObjectMap, b: json.ObjectMap) bool {
    if (a.count() != b.count()) return false;
    var it = a.iterator();
    while (it.next()) |entry| {
        const key = entry.key_ptr.*;
        const other = b.get(key) orelse return false;
        if (!valuesEqual(entry.value_ptr.*, other)) return false;
    }
    return true;
}

fn expectJsonEqual(allocator: Allocator, left: []const u8, right: []const u8) !void {
    var parsed_left = try parseBytesToValue(allocator, left);
    defer parsed_left.deinit();
    var parsed_right = try parseBytesToValue(allocator, right);
    defer parsed_right.deinit();

    try testing.expect(valuesEqual(parsed_left.value, parsed_right.value));
}

test "round trip meta-schema" {
    const allocator = testing.allocator;

    const source = try std.fs.cwd().readFileAlloc(allocator, "src/schema.json", std.math.maxInt(usize));
    defer allocator.free(source);

    var parsed = try schema.parseJSONSchema(allocator, source);
    defer parsed.deinit();

    const serialized = try schema.stringifyAlloc(allocator, parsed.value, .{});
    defer allocator.free(serialized);

    var reparsed = try schema.parseJSONSchema(allocator, serialized);
    defer reparsed.deinit();

    try expectJsonEqual(allocator, source, serialized);
}

test "modify and stringify meta-schema" {
    const allocator = testing.allocator;

    const source = try std.fs.cwd().readFileAlloc(allocator, "src/schema.json", std.math.maxInt(usize));
    defer allocator.free(source);

    var parsed = try schema.parseJSONSchema(allocator, source);
    defer parsed.deinit();

    try testing.expect(parsed.value == .object);

    const new_title = try allocator.dupe(u8, "Modified meta-schema title");
    defer allocator.free(new_title);

    const previous_title = parsed.value.object.*.title;
    parsed.value.object.*.title = new_title;

    const serialized = try schema.stringifyAlloc(allocator, parsed.value, .{});
    defer allocator.free(serialized);

    var reparsed = try parseBytesToValue(allocator, serialized);
    defer reparsed.deinit();

    const title_value = reparsed.value.object.get("title") orelse {
        try testing.expect(false);
        return;
    };

    switch (title_value) {
        .string => |title_text| try testing.expect(std.mem.eql(u8, title_text, new_title)),
        else => try testing.expect(false),
    }

    // Restore previous state to avoid dangling references before allocator cleanup.
    parsed.value.object.*.title = previous_title;
}
