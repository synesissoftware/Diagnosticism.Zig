const std = @import("std");
const diagnosticism = @import("diagnosticism");

pub fn main(init: std.process.Init) !void {
    var buffer: [64]u8 = undefined;
    var stdout_impl = std.Io.File.stdout().writer(init.io, &buffer);
    const stdout = &stdout_impl.interface;

    try stdout.print("{s}\n", .{diagnosticism.VERSION});
    try stdout.flush();
}
