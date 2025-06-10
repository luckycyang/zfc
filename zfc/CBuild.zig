const std = @import("std");
const Module = std.Build.Module;
const LinkObject = Module.LinkObject;
const CSourceFile = Module.CSourceFile;
const CSourceFiles = Module.CSourceFiles;
const AddCSourceFilesOptions = Module.AddCSourceFilesOptions;

const CBuild = @This();
owner: *std.Build,
name: []const u8,
link_objects: std.ArrayListUnmanaged(LinkObject),

// ref std.Build.Module
pub fn addCSourceFile(c: *CBuild, source: CSourceFile) void {
    const b = c.owner;
    const allocator = b.allocator;
    const c_source_file = allocator.create(CSourceFile) catch @panic("OOM");
    c_source_file.* = source.dupe(b);
    c.link_objects.append(allocator, .{ .c_source_file = c_source_file }) catch @panic("OOM");
}

pub fn addCSourceFiles(c: *CBuild, options: AddCSourceFilesOptions) void {
    const b = c.owner;
    const allocator = b.allocator;

    for (options.files) |path| {
        if (std.fs.path.isAbsolute(path)) {
            std.debug.panic(
                "file paths added with 'addCSourceFiles' must be relative, found absolute path '{s}'",
                .{path},
            );
        }
    }

    const c_source_files = allocator.create(CSourceFiles) catch @panic("OOM");
    c_source_files.* = .{
        .root = options.root orelse b.path(""),
        .files = b.dupeStrings(options.files),
        .flags = b.dupeStrings(options.flags),
        .language = options.language,
    };
    c.link_objects.append(allocator, .{ .c_source_files = c_source_files }) catch @panic("OOM");
}
