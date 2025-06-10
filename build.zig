const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod_zfc = b.createModule(.{
        .root_source_file = b.path("zfc/zfc.zig"),
        .target = target,
        .optimize = optimize,
    });

    const zfc = b.addLibrary(.{ .name = "zfc", .root_module = mod_zfc });
    b.installArtifact(zfc);
}
