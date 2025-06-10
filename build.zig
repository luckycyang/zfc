const std = @import("std");

// for build.zig
pub const zfc = @import("zfc/zfc.zig");

// nothing, this a package for zig build, not that lib for app
pub fn build(_: *std.Build) void {}
