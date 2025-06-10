const CompileCommand = @This();
const std = @import("std");
const LinkObject = std.Build.Module.LinkObject;
directory: []const u8,
arguments: []const u8,
file: []const u8,

pub fn fromLinkObject(o: *LinkObject) CompileCommand {
    const ans: CompileCommand = .{ .directory = &.{}, .arguments = &.{}, .file = &.{} };
    switch (o.*) {
        .c_source_file => |i| std.debug.print("{any}\r\n", .{i}),
        .c_source_files => |i| std.debug.print("{any}\r\n", .{i}),
        else => {},
    }
    return ans;
}
