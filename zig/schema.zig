const std = @import("std");
const json = std.json;
const mem = std.mem;

const Allocator = mem.Allocator;
const ParseOptions = json.ParseOptions;
const Value = json.Value;
const innerParse = json.innerParse;
const innerParseFromValue = json.innerParseFromValue;

pub const Id = []const u8;
pub const SchemaUri = []const u8;
pub const Ref = []const u8;
pub const Comment = []const u8;
pub const Title = []const u8;
pub const Description = []const u8;
pub const AlwaysTrue = Value;
pub const ReadOnly = bool;
pub const Examples = []Value;
pub const MultipleOf = f64;
pub const Maximum = f64;
pub const ExclusiveMaximum = f64;
pub const Minimum = f64;
pub const ExclusiveMinimum = f64;
pub const NonNegativeInteger = u64;
pub const NonNegativeIntegerDefaultZero = u64;
pub const Pattern = []const u8;
pub const UniqueItems = bool;
pub const StringArray = []const []const u8;
pub const Format = []const u8;
pub const ContentMediaType = []const u8;
pub const ContentEncoding = []const u8;
pub const EnumValues = []Value;

pub const SimpleTypes = enum {
    array,
    boolean,
    integer,
    null,
    number,
    object,
    string,
};

pub const Items = union(enum) {
    schema: JSONSchema,
    schema_array: []JSONSchema,

    pub fn jsonParse(allocator: Allocator, source: anytype, options: ParseOptions) !Items {
        return switch (try source.peekNextTokenType()) {
            .array_begin => .{ .schema_array = try innerParse([]JSONSchema, allocator, source, options) },
            .object_begin, .true, .false => .{ .schema = try innerParse(JSONSchema, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonParseFromValue(allocator: Allocator, source: Value, options: ParseOptions) !Items {
        return switch (source) {
            .array => .{ .schema_array = try innerParseFromValue([]JSONSchema, allocator, source, options) },
            .object, .bool => .{ .schema = try innerParseFromValue(JSONSchema, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonStringify(self: Items, jws: anytype) !void {
        switch (self) {
            .schema => |schema_value| try jws.write(schema_value),
            .schema_array => |schema_list| try jws.write(schema_list),
        }
    }
};

pub const DependenciesSet = union(enum) {
    schema: JSONSchema,
    string_array: StringArray,

    pub fn jsonParse(allocator: Allocator, source: anytype, options: ParseOptions) !DependenciesSet {
        return switch (try source.peekNextTokenType()) {
            .array_begin => .{ .string_array = try innerParse(StringArray, allocator, source, options) },
            .object_begin, .true, .false => .{ .schema = try innerParse(JSONSchema, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonParseFromValue(allocator: Allocator, source: Value, options: ParseOptions) !DependenciesSet {
        return switch (source) {
            .array => .{ .string_array = try innerParseFromValue(StringArray, allocator, source, options) },
            .object, .bool => .{ .schema = try innerParseFromValue(JSONSchema, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonStringify(self: DependenciesSet, jws: anytype) !void {
        switch (self) {
            .schema => |schema_value| try jws.write(schema_value),
            .string_array => |names| try jws.write(names),
        }
    }
};

pub const Type = union(enum) {
    simple_type: SimpleTypes,
    array_of_simple_types: []const SimpleTypes,

    pub fn jsonParse(allocator: Allocator, source: anytype, options: ParseOptions) !Type {
        return switch (try source.peekNextTokenType()) {
            .array_begin => .{ .array_of_simple_types = try innerParse([]const SimpleTypes, allocator, source, options) },
            .string => .{ .simple_type = try innerParse(SimpleTypes, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonParseFromValue(allocator: Allocator, source: Value, options: ParseOptions) !Type {
        return switch (source) {
            .array => .{ .array_of_simple_types = try innerParseFromValue([]const SimpleTypes, allocator, source, options) },
            .string => .{ .simple_type = try innerParseFromValue(SimpleTypes, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonStringify(self: Type, jws: anytype) !void {
        switch (self) {
            .simple_type => |tag| try jws.write(tag),
            .array_of_simple_types => |tags| try jws.write(tags),
        }
    }
};

pub const JSONSchemaObject = struct {
    @"$id": ?Id = null,
    @"$schema": ?SchemaUri = null,
    @"$ref": ?Ref = null,
    @"$comment": ?Comment = null,
    title: ?Title = null,
    description: ?Description = null,
    default: ?AlwaysTrue = null,
    readOnly: ?ReadOnly = null,
    examples: ?Examples = null,
    multipleOf: ?MultipleOf = null,
    maximum: ?Maximum = null,
    exclusiveMaximum: ?ExclusiveMaximum = null,
    minimum: ?Minimum = null,
    exclusiveMinimum: ?ExclusiveMinimum = null,
    maxLength: ?NonNegativeInteger = null,
    minLength: ?NonNegativeIntegerDefaultZero = null,
    pattern: ?Pattern = null,
    additionalItems: ?JSONSchema = null,
    items: ?Items = null,
    maxItems: ?NonNegativeInteger = null,
    minItems: ?NonNegativeIntegerDefaultZero = null,
    uniqueItems: ?UniqueItems = null,
    contains: ?JSONSchema = null,
    maxProperties: ?NonNegativeInteger = null,
    minProperties: ?NonNegativeIntegerDefaultZero = null,
    required: ?StringArray = null,
    additionalProperties: ?JSONSchema = null,
    definitions: ?json.ArrayHashMap(JSONSchema) = null,
    properties: ?json.ArrayHashMap(JSONSchema) = null,
    patternProperties: ?json.ArrayHashMap(JSONSchema) = null,
    dependencies: ?json.ArrayHashMap(DependenciesSet) = null,
    propertyNames: ?JSONSchema = null,
    @"const": ?AlwaysTrue = null,
    @"enum": ?EnumValues = null,
    type: ?Type = null,
    format: ?Format = null,
    contentMediaType: ?ContentMediaType = null,
    contentEncoding: ?ContentEncoding = null,
    @"if": ?JSONSchema = null,
    then: ?JSONSchema = null,
    @"else": ?JSONSchema = null,
    allOf: ?[]JSONSchema = null,
    anyOf: ?[]JSONSchema = null,
    oneOf: ?[]JSONSchema = null,
    not: ?JSONSchema = null,
    extra_keywords: json.ArrayHashMap(AlwaysTrue) = .{},

    pub fn jsonParse(allocator: Allocator, source: anytype, options: ParseOptions) !JSONSchemaObject {
        if (.object_begin != try source.next()) return error.UnexpectedToken;

        var result = JSONSchemaObject{};
        while (true) {
            switch (try source.peekNextTokenType()) {
                .object_end => {
                    _ = try source.next();
                    return result;
                },
                .string => {},
                else => return error.UnexpectedToken,
            }

            const key_token = try source.nextAlloc(allocator, options.allocate.?);
            const key = switch (key_token) {
                inline .string, .allocated_string => |bytes| bytes,
                else => unreachable,
            };

            if (mem.eql(u8, key, "$id")) {
                result.@"$id" = try innerParse(Id, allocator, source, options);
            } else if (mem.eql(u8, key, "$schema")) {
                result.@"$schema" = try innerParse(SchemaUri, allocator, source, options);
            } else if (mem.eql(u8, key, "$ref")) {
                result.@"$ref" = try innerParse(Ref, allocator, source, options);
            } else if (mem.eql(u8, key, "$comment")) {
                result.@"$comment" = try innerParse(Comment, allocator, source, options);
            } else if (mem.eql(u8, key, "title")) {
                result.title = try innerParse(Title, allocator, source, options);
            } else if (mem.eql(u8, key, "description")) {
                result.description = try innerParse(Description, allocator, source, options);
            } else if (mem.eql(u8, key, "default")) {
                result.default = try innerParse(AlwaysTrue, allocator, source, options);
            } else if (mem.eql(u8, key, "readOnly")) {
                result.readOnly = try innerParse(ReadOnly, allocator, source, options);
            } else if (mem.eql(u8, key, "examples")) {
                result.examples = try innerParse(Examples, allocator, source, options);
            } else if (mem.eql(u8, key, "multipleOf")) {
                result.multipleOf = try innerParse(MultipleOf, allocator, source, options);
            } else if (mem.eql(u8, key, "maximum")) {
                result.maximum = try innerParse(Maximum, allocator, source, options);
            } else if (mem.eql(u8, key, "exclusiveMaximum")) {
                result.exclusiveMaximum = try innerParse(ExclusiveMaximum, allocator, source, options);
            } else if (mem.eql(u8, key, "minimum")) {
                result.minimum = try innerParse(Minimum, allocator, source, options);
            } else if (mem.eql(u8, key, "exclusiveMinimum")) {
                result.exclusiveMinimum = try innerParse(ExclusiveMinimum, allocator, source, options);
            } else if (mem.eql(u8, key, "maxLength")) {
                result.maxLength = try innerParse(NonNegativeInteger, allocator, source, options);
            } else if (mem.eql(u8, key, "minLength")) {
                result.minLength = try innerParse(NonNegativeIntegerDefaultZero, allocator, source, options);
            } else if (mem.eql(u8, key, "pattern")) {
                result.pattern = try innerParse(Pattern, allocator, source, options);
            } else if (mem.eql(u8, key, "additionalItems")) {
                result.additionalItems = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "items")) {
                result.items = try innerParse(Items, allocator, source, options);
            } else if (mem.eql(u8, key, "maxItems")) {
                result.maxItems = try innerParse(NonNegativeInteger, allocator, source, options);
            } else if (mem.eql(u8, key, "minItems")) {
                result.minItems = try innerParse(NonNegativeIntegerDefaultZero, allocator, source, options);
            } else if (mem.eql(u8, key, "uniqueItems")) {
                result.uniqueItems = try innerParse(UniqueItems, allocator, source, options);
            } else if (mem.eql(u8, key, "contains")) {
                result.contains = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "maxProperties")) {
                result.maxProperties = try innerParse(NonNegativeInteger, allocator, source, options);
            } else if (mem.eql(u8, key, "minProperties")) {
                result.minProperties = try innerParse(NonNegativeIntegerDefaultZero, allocator, source, options);
            } else if (mem.eql(u8, key, "required")) {
                result.required = try innerParse(StringArray, allocator, source, options);
            } else if (mem.eql(u8, key, "additionalProperties")) {
                result.additionalProperties = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "definitions")) {
                result.definitions = try innerParse(json.ArrayHashMap(JSONSchema), allocator, source, options);
            } else if (mem.eql(u8, key, "properties")) {
                result.properties = try innerParse(json.ArrayHashMap(JSONSchema), allocator, source, options);
            } else if (mem.eql(u8, key, "patternProperties")) {
                result.patternProperties = try innerParse(json.ArrayHashMap(JSONSchema), allocator, source, options);
            } else if (mem.eql(u8, key, "dependencies")) {
                result.dependencies = try innerParse(json.ArrayHashMap(DependenciesSet), allocator, source, options);
            } else if (mem.eql(u8, key, "propertyNames")) {
                result.propertyNames = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "const")) {
                result.@"const" = try innerParse(AlwaysTrue, allocator, source, options);
            } else if (mem.eql(u8, key, "enum")) {
                result.@"enum" = try innerParse(EnumValues, allocator, source, options);
            } else if (mem.eql(u8, key, "type")) {
                result.type = try innerParse(Type, allocator, source, options);
            } else if (mem.eql(u8, key, "format")) {
                result.format = try innerParse(Format, allocator, source, options);
            } else if (mem.eql(u8, key, "contentMediaType")) {
                result.contentMediaType = try innerParse(ContentMediaType, allocator, source, options);
            } else if (mem.eql(u8, key, "contentEncoding")) {
                result.contentEncoding = try innerParse(ContentEncoding, allocator, source, options);
            } else if (mem.eql(u8, key, "if")) {
                result.@"if" = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "then")) {
                result.then = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "else")) {
                result.@"else" = try innerParse(JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "allOf")) {
                result.allOf = try innerParse([]JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "anyOf")) {
                result.anyOf = try innerParse([]JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "oneOf")) {
                result.oneOf = try innerParse([]JSONSchema, allocator, source, options);
            } else if (mem.eql(u8, key, "not")) {
                result.not = try innerParse(JSONSchema, allocator, source, options);
            } else {
                const value = try innerParse(AlwaysTrue, allocator, source, options);
                try result.extra_keywords.map.put(allocator, key, value);
            }
        }
    }

    pub fn jsonParseFromValue(allocator: Allocator, source: Value, options: ParseOptions) !JSONSchemaObject {
        if (source != .object) return error.UnexpectedToken;

        var result = JSONSchemaObject{};
        var it = source.object.iterator();
        while (it.next()) |entry| {
            const key = entry.key_ptr.*;
            const val = entry.value_ptr.*;
            if (mem.eql(u8, key, "$id")) {
                result.@"$id" = try innerParseFromValue(Id, allocator, val, options);
            } else if (mem.eql(u8, key, "$schema")) {
                result.@"$schema" = try innerParseFromValue(SchemaUri, allocator, val, options);
            } else if (mem.eql(u8, key, "$ref")) {
                result.@"$ref" = try innerParseFromValue(Ref, allocator, val, options);
            } else if (mem.eql(u8, key, "$comment")) {
                result.@"$comment" = try innerParseFromValue(Comment, allocator, val, options);
            } else if (mem.eql(u8, key, "title")) {
                result.title = try innerParseFromValue(Title, allocator, val, options);
            } else if (mem.eql(u8, key, "description")) {
                result.description = try innerParseFromValue(Description, allocator, val, options);
            } else if (mem.eql(u8, key, "default")) {
                result.default = try innerParseFromValue(AlwaysTrue, allocator, val, options);
            } else if (mem.eql(u8, key, "readOnly")) {
                result.readOnly = try innerParseFromValue(ReadOnly, allocator, val, options);
            } else if (mem.eql(u8, key, "examples")) {
                result.examples = try innerParseFromValue(Examples, allocator, val, options);
            } else if (mem.eql(u8, key, "multipleOf")) {
                result.multipleOf = try innerParseFromValue(MultipleOf, allocator, val, options);
            } else if (mem.eql(u8, key, "maximum")) {
                result.maximum = try innerParseFromValue(Maximum, allocator, val, options);
            } else if (mem.eql(u8, key, "exclusiveMaximum")) {
                result.exclusiveMaximum = try innerParseFromValue(ExclusiveMaximum, allocator, val, options);
            } else if (mem.eql(u8, key, "minimum")) {
                result.minimum = try innerParseFromValue(Minimum, allocator, val, options);
            } else if (mem.eql(u8, key, "exclusiveMinimum")) {
                result.exclusiveMinimum = try innerParseFromValue(ExclusiveMinimum, allocator, val, options);
            } else if (mem.eql(u8, key, "maxLength")) {
                result.maxLength = try innerParseFromValue(NonNegativeInteger, allocator, val, options);
            } else if (mem.eql(u8, key, "minLength")) {
                result.minLength = try innerParseFromValue(NonNegativeIntegerDefaultZero, allocator, val, options);
            } else if (mem.eql(u8, key, "pattern")) {
                result.pattern = try innerParseFromValue(Pattern, allocator, val, options);
            } else if (mem.eql(u8, key, "additionalItems")) {
                result.additionalItems = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "items")) {
                result.items = try innerParseFromValue(Items, allocator, val, options);
            } else if (mem.eql(u8, key, "maxItems")) {
                result.maxItems = try innerParseFromValue(NonNegativeInteger, allocator, val, options);
            } else if (mem.eql(u8, key, "minItems")) {
                result.minItems = try innerParseFromValue(NonNegativeIntegerDefaultZero, allocator, val, options);
            } else if (mem.eql(u8, key, "uniqueItems")) {
                result.uniqueItems = try innerParseFromValue(UniqueItems, allocator, val, options);
            } else if (mem.eql(u8, key, "contains")) {
                result.contains = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "maxProperties")) {
                result.maxProperties = try innerParseFromValue(NonNegativeInteger, allocator, val, options);
            } else if (mem.eql(u8, key, "minProperties")) {
                result.minProperties = try innerParseFromValue(NonNegativeIntegerDefaultZero, allocator, val, options);
            } else if (mem.eql(u8, key, "required")) {
                result.required = try innerParseFromValue(StringArray, allocator, val, options);
            } else if (mem.eql(u8, key, "additionalProperties")) {
                result.additionalProperties = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "definitions")) {
                result.definitions = try innerParseFromValue(json.ArrayHashMap(JSONSchema), allocator, val, options);
            } else if (mem.eql(u8, key, "properties")) {
                result.properties = try innerParseFromValue(json.ArrayHashMap(JSONSchema), allocator, val, options);
            } else if (mem.eql(u8, key, "patternProperties")) {
                result.patternProperties = try innerParseFromValue(json.ArrayHashMap(JSONSchema), allocator, val, options);
            } else if (mem.eql(u8, key, "dependencies")) {
                result.dependencies = try innerParseFromValue(json.ArrayHashMap(DependenciesSet), allocator, val, options);
            } else if (mem.eql(u8, key, "propertyNames")) {
                result.propertyNames = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "const")) {
                result.@"const" = try innerParseFromValue(AlwaysTrue, allocator, val, options);
            } else if (mem.eql(u8, key, "enum")) {
                result.@"enum" = try innerParseFromValue(EnumValues, allocator, val, options);
            } else if (mem.eql(u8, key, "type")) {
                result.type = try innerParseFromValue(Type, allocator, val, options);
            } else if (mem.eql(u8, key, "format")) {
                result.format = try innerParseFromValue(Format, allocator, val, options);
            } else if (mem.eql(u8, key, "contentMediaType")) {
                result.contentMediaType = try innerParseFromValue(ContentMediaType, allocator, val, options);
            } else if (mem.eql(u8, key, "contentEncoding")) {
                result.contentEncoding = try innerParseFromValue(ContentEncoding, allocator, val, options);
            } else if (mem.eql(u8, key, "if")) {
                result.@"if" = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "then")) {
                result.then = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "else")) {
                result.@"else" = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "allOf")) {
                result.allOf = try innerParseFromValue([]JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "anyOf")) {
                result.anyOf = try innerParseFromValue([]JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "oneOf")) {
                result.oneOf = try innerParseFromValue([]JSONSchema, allocator, val, options);
            } else if (mem.eql(u8, key, "not")) {
                result.not = try innerParseFromValue(JSONSchema, allocator, val, options);
            } else {
                try result.extra_keywords.map.put(allocator, key, try innerParseFromValue(AlwaysTrue, allocator, val, options));
            }
        }
        return result;
    }

    pub fn jsonStringify(self: JSONSchemaObject, jws: anytype) !void {
        try jws.beginObject();
        if (self.@"$id") |value| {
            try jws.objectField("$id");
            try jws.write(value);
        }
        if (self.@"$schema") |value| {
            try jws.objectField("$schema");
            try jws.write(value);
        }
        if (self.@"$ref") |value| {
            try jws.objectField("$ref");
            try jws.write(value);
        }
        if (self.@"$comment") |value| {
            try jws.objectField("$comment");
            try jws.write(value);
        }
        if (self.title) |value| {
            try jws.objectField("title");
            try jws.write(value);
        }
        if (self.description) |value| {
            try jws.objectField("description");
            try jws.write(value);
        }
        if (self.default) |value| {
            try jws.objectField("default");
            try jws.write(value);
        }
        if (self.readOnly) |value| {
            try jws.objectField("readOnly");
            try jws.write(value);
        }
        if (self.examples) |value| {
            try jws.objectField("examples");
            try jws.write(value);
        }
        if (self.multipleOf) |value| {
            try jws.objectField("multipleOf");
            try jws.write(value);
        }
        if (self.maximum) |value| {
            try jws.objectField("maximum");
            try jws.write(value);
        }
        if (self.exclusiveMaximum) |value| {
            try jws.objectField("exclusiveMaximum");
            try jws.write(value);
        }
        if (self.minimum) |value| {
            try jws.objectField("minimum");
            try jws.write(value);
        }
        if (self.exclusiveMinimum) |value| {
            try jws.objectField("exclusiveMinimum");
            try jws.write(value);
        }
        if (self.maxLength) |value| {
            try jws.objectField("maxLength");
            try jws.write(value);
        }
        if (self.minLength) |value| {
            try jws.objectField("minLength");
            try jws.write(value);
        }
        if (self.pattern) |value| {
            try jws.objectField("pattern");
            try jws.write(value);
        }
        if (self.additionalItems) |value| {
            try jws.objectField("additionalItems");
            try jws.write(value);
        }
        if (self.items) |value| {
            try jws.objectField("items");
            try jws.write(value);
        }
        if (self.maxItems) |value| {
            try jws.objectField("maxItems");
            try jws.write(value);
        }
        if (self.minItems) |value| {
            try jws.objectField("minItems");
            try jws.write(value);
        }
        if (self.uniqueItems) |value| {
            try jws.objectField("uniqueItems");
            try jws.write(value);
        }
        if (self.contains) |value| {
            try jws.objectField("contains");
            try jws.write(value);
        }
        if (self.maxProperties) |value| {
            try jws.objectField("maxProperties");
            try jws.write(value);
        }
        if (self.minProperties) |value| {
            try jws.objectField("minProperties");
            try jws.write(value);
        }
        if (self.required) |value| {
            try jws.objectField("required");
            try jws.write(value);
        }
        if (self.additionalProperties) |value| {
            try jws.objectField("additionalProperties");
            try jws.write(value);
        }
        if (self.definitions) |value| {
            try jws.objectField("definitions");
            try jws.write(value);
        }
        if (self.properties) |value| {
            try jws.objectField("properties");
            try jws.write(value);
        }
        if (self.patternProperties) |value| {
            try jws.objectField("patternProperties");
            try jws.write(value);
        }
        if (self.dependencies) |value| {
            try jws.objectField("dependencies");
            try jws.write(value);
        }
        if (self.propertyNames) |value| {
            try jws.objectField("propertyNames");
            try jws.write(value);
        }
        if (self.@"const") |value| {
            try jws.objectField("const");
            try jws.write(value);
        }
        if (self.@"enum") |value| {
            try jws.objectField("enum");
            try jws.write(value);
        }
        if (self.type) |value| {
            try jws.objectField("type");
            try jws.write(value);
        }
        if (self.format) |value| {
            try jws.objectField("format");
            try jws.write(value);
        }
        if (self.contentMediaType) |value| {
            try jws.objectField("contentMediaType");
            try jws.write(value);
        }
        if (self.contentEncoding) |value| {
            try jws.objectField("contentEncoding");
            try jws.write(value);
        }
        if (self.@"if") |value| {
            try jws.objectField("if");
            try jws.write(value);
        }
        if (self.then) |value| {
            try jws.objectField("then");
            try jws.write(value);
        }
        if (self.@"else") |value| {
            try jws.objectField("else");
            try jws.write(value);
        }
        if (self.allOf) |value| {
            try jws.objectField("allOf");
            try jws.write(value);
        }
        if (self.anyOf) |value| {
            try jws.objectField("anyOf");
            try jws.write(value);
        }
        if (self.oneOf) |value| {
            try jws.objectField("oneOf");
            try jws.write(value);
        }
        if (self.not) |value| {
            try jws.objectField("not");
            try jws.write(value);
        }
        var extra_it = self.extra_keywords.map.iterator();
        while (extra_it.next()) |entry| {
            try jws.objectField(entry.key_ptr.*);
            try jws.write(entry.value_ptr.*);
        }
        try jws.endObject();
    }
};

pub const JSONSchemaBoolean = bool;

pub const JSONSchema = union(enum) {
    object: *JSONSchemaObject,
    boolean: JSONSchemaBoolean,

    pub fn jsonParse(allocator: Allocator, source: anytype, options: ParseOptions) !JSONSchema {
        return switch (try source.peekNextTokenType()) {
            .object_begin => blk: {
                const parsed_object = try innerParse(JSONSchemaObject, allocator, source, options);
                const stored = try allocator.create(JSONSchemaObject);
                stored.* = parsed_object;
                break :blk JSONSchema{ .object = stored };
            },
            .true, .false => .{ .boolean = try innerParse(JSONSchemaBoolean, allocator, source, options) },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonParseFromValue(allocator: Allocator, source: Value, options: ParseOptions) !JSONSchema {
        return switch (source) {
            .object => blk: {
                const parsed_object = try innerParseFromValue(JSONSchemaObject, allocator, source, options);
                const stored = try allocator.create(JSONSchemaObject);
                stored.* = parsed_object;
                break :blk JSONSchema{ .object = stored };
            },
            .bool => .{ .boolean = source.bool },
            else => error.UnexpectedToken,
        };
    }

    pub fn jsonStringify(self: JSONSchema, jws: anytype) !void {
        switch (self) {
            .object => |schema_object| try jws.write(schema_object.*),
            .boolean => |value| try jws.write(value),
        }
    }
};

pub fn parseJSONSchema(allocator: Allocator, source: []const u8) !json.Parsed(JSONSchema) {
    return json.parseFromSlice(JSONSchema, allocator, source, .{
        .duplicate_field_behavior = .use_last,
        .ignore_unknown_fields = false,
        .allocate = .alloc_always,
    });
}

pub fn stringifyAlloc(allocator: Allocator, schema: JSONSchema, options: json.Stringify.Options) ![]u8 {
    var out = std.io.Writer.Allocating.init(allocator);
    defer out.deinit();

    var stream = json.Stringify{
        .writer = &out.writer,
        .options = options,
    };
    try stream.write(schema);

    return allocator.dupe(u8, out.written());
}
