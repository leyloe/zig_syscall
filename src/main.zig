const std = @import("std");
const zig_syscall = @import("zig_syscall");
const windows = std.os.windows;

pub fn main() !void {
    var io_status: windows.IO_STATUS_BLOCK = undefined;
    const stdout = windows.peb().ProcessParameters.hStdOutput;
    const message = "Hello World!\n";
    const status = zig_syscall.syscall9(
        0x0008,
        @intFromPtr(stdout),
        0,
        0,
        0,
        @intFromPtr(&io_status),
        @intFromPtr(message.ptr),
        message.len,
        0,
        0,
    );
    std.debug.print("NTSTATUS: {}", .{status});
}
