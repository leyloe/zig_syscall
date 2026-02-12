const std = @import("std");
const windows = std.os.windows;

pub export fn syscall1(
    number: usize,
    arg1: usize,
) windows.NTSTATUS {
    return asm volatile ("syscall"
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
        : .{ .rcx = true, .r11 = true });
}

pub export fn syscall2(
    number: usize,
    arg1: usize,
    arg2: usize,
) windows.NTSTATUS {
    return asm volatile ("syscall"
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
        : .{ .rcx = true, .r11 = true });
}

pub export fn syscall3(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
) windows.NTSTATUS {
    return asm volatile ("syscall"
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
        : .{ .rcx = true, .r11 = true });
}

pub export fn syscall4(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
) windows.NTSTATUS {
    return asm volatile ("syscall"
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
        : .{ .rcx = true, .r11 = true });
}

pub export fn syscall5(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $48, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ syscall
        \\ addq $48, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
        : .{ .rcx = true, .r11 = true, .memory = true });
}

pub export fn syscall6(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $56, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ movq %[arg6], 48(%%rsp)
        \\ syscall
        \\ addq $56, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
          [arg6] "ri" (arg6),
        : .{ .rcx = true, .r11 = true, .memory = true });
}

pub export fn syscall7(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $64, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ movq %[arg6], 48(%%rsp)
        \\ movq %[arg7], 56(%%rsp)
        \\ syscall
        \\ addq $64, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
          [arg6] "ri" (arg6),
          [arg7] "ri" (arg7),
        : .{ .rcx = true, .r11 = true, .memory = true });
}

pub export fn syscall8(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
    arg8: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $72, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ movq %[arg6], 48(%%rsp)
        \\ movq %[arg7], 56(%%rsp)
        \\ movq %[arg8], 64(%%rsp)
        \\ syscall
        \\ addq $72, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
          [arg6] "ri" (arg6),
          [arg7] "ri" (arg7),
          [arg8] "ri" (arg8),
        : .{ .rcx = true, .r11 = true, .memory = true });
}

pub export fn syscall9(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
    arg8: usize,
    arg9: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $80, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ movq %[arg6], 48(%%rsp)
        \\ movq %[arg7], 56(%%rsp)
        \\ movq %[arg8], 64(%%rsp)
        \\ movq %[arg9], 72(%%rsp)
        \\ syscall
        \\ addq $80, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
          [arg6] "ri" (arg6),
          [arg7] "ri" (arg7),
          [arg8] "ri" (arg8),
          [arg9] "ri" (arg9),
        : .{ .rcx = true, .r11 = true, .memory = true });
}

pub export fn syscall10(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
    arg8: usize,
    arg9: usize,
    arg10: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $88, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ movq %[arg6], 48(%%rsp)
        \\ movq %[arg7], 56(%%rsp)
        \\ movq %[arg8], 64(%%rsp)
        \\ movq %[arg9], 72(%%rsp)
        \\ movq %[arg10], 80(%%rsp)
        \\ syscall
        \\ addq $88, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
          [arg6] "ri" (arg6),
          [arg7] "ri" (arg7),
          [arg8] "ri" (arg8),
          [arg9] "ri" (arg9),
          [arg10] "ri" (arg10),
        : .{ .rcx = true, .r11 = true, .memory = true });
}

pub export fn syscall11(
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
    arg8: usize,
    arg9: usize,
    arg10: usize,
    arg11: usize,
) windows.NTSTATUS {
    return asm volatile (
        \\ subq $96, %%rsp
        \\ movq %[arg5], 40(%%rsp)
        \\ movq %[arg6], 48(%%rsp)
        \\ movq %[arg7], 56(%%rsp)
        \\ movq %[arg8], 64(%%rsp)
        \\ movq %[arg9], 72(%%rsp)
        \\ movq %[arg10], 80(%%rsp)
        \\ movq %[arg11], 88(%%rsp)
        \\ syscall
        \\ addq $96, %%rsp
        : [ret] "={rax}" (-> windows.NTSTATUS),
        : [number] "{rax}" (number),
          [arg1] "{r10}" (arg1),
          [arg2] "{rdx}" (arg2),
          [arg3] "{r8}" (arg3),
          [arg4] "{r9}" (arg4),
          [arg5] "ri" (arg5),
          [arg6] "ri" (arg6),
          [arg7] "ri" (arg7),
          [arg8] "ri" (arg8),
          [arg9] "ri" (arg9),
          [arg10] "ri" (arg10),
          [arg11] "ri" (arg11),
        : .{ .rcx = true, .r11 = true, .memory = true });
}
