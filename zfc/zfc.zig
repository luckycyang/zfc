pub const Foo = struct {
    pub fn foo() []const u8 {
        return "foo";
    }
};

pub const Bar = struct {
    pub fn bar() []const u8 {
        return "bar";
    }
};

pub const CBuild = @import("CBuild.zig");
pub const CompileCommand = @import("CompileCommand.zig");
