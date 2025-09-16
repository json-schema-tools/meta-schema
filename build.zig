const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const meta_schema = b.addModule("meta_schema", .{
        .root_source_file = .{ .cwd_relative = "zig/schema.zig" },
    });

    const tests_module = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "zig/schema_test.zig" },
        .target = target,
        .optimize = optimize,
    });
    tests_module.addImport("meta_schema", meta_schema);

    const unit_tests = b.addTest(.{
        .root_module = tests_module,
    });

    const test_step = b.step("test", "Run Zig unit tests");
    test_step.dependOn(&unit_tests.step);
}
