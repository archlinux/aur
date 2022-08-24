const std = @import("std");

pub fn main() !void {
    std.debug.print("Hello World\n", .{});
}

test "tester" {
    try std.testing.expectEqual(4 + 5, 9);
}
