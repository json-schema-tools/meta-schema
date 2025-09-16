# Zig Meta-Schema Support

This directory provides a `schema.zig` module that mirrors the repository's
`src/schema.json` meta-schema. It exposes parsing helpers built on top of
`std.json`; import it from the repository root with `@import("zig/schema.zig")`.

## Using the module

```zig
const std = @import("std");
const meta = @import("schema.zig");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();
    const bytes = try std.fs.cwd().readFileAlloc(allocator, "src/schema.json", std.math.maxInt(usize));
    defer allocator.free(bytes);

    var parsed = try meta.parseJSONSchema(allocator, bytes);
    defer parsed.deinit();

    // `parsed.value` is a `meta.JSONSchema` union you can inspect or transform.
}
```

## Testing

Run via the build system, or directly with `zig test`:

```sh
zig build test
# or
ZIG_GLOBAL_CACHE_DIR=zig-cache ZIG_LOCAL_CACHE_DIR=zig-cache zig test zig/schema_test.zig
```

The test parses `src/schema.json`, re-serializes it with `schema.stringifyAlloc`,
and verifies that the JSON structure is preserved.

## Consuming from another project

Add this repository as a dependency in your `build.zig.zon` and wire the module:

```zig
const meta_dep = b.dependency("meta-schema", .{});
const meta_schema = meta_dep.module("meta_schema");
your_module.addImport("meta_schema", meta_schema);
```

Then `@import("meta_schema")` from your code to access the types and helpers.
