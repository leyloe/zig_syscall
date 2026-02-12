const std = @import("std");
const zig_syscall = @import("zig_syscall");
const windows = std.os.windows;

pub fn main() !void {
    var io_status: windows.IO_STATUS_BLOCK = undefined;
    const stdout = windows.peb().ProcessParameters.hStdOutput;
    const message = "Hello World!\n";
    const raw = zig_syscall.syscall(true, 0x0008, .{
        @intFromPtr(stdout),
        0,
        0,
        0,
        @intFromPtr(&io_status),
        @intFromPtr(message.ptr),
        message.len,
        0,
        0,
    });
    const status: windows.NTSTATUS = @enumFromInt(@as(u32, @truncate(raw)));
    std.debug.print("NTSTATUS: {s}\n", .{@tagName(status)});
}
