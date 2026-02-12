fn syscall0(
    comptime has_return: bool,
    number: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile ("syscall"
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
            : .{ .rcx = true, .r11 = true });
    } else {
        asm volatile ("syscall"
            :
            : [number] "{rax}" (number),
            : .{ .rcx = true, .r11 = true });
    }
}

fn syscall1(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile ("syscall"
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
            : .{ .rcx = true, .r11 = true });
    } else {
        asm volatile ("syscall"
            :
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
            : .{ .rcx = true, .r11 = true });
    }
}

fn syscall2(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile ("syscall"
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
            : .{ .rcx = true, .r11 = true });
    } else {
        asm volatile ("syscall"
            :
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
            : .{ .rcx = true, .r11 = true });
    }
}

fn syscall3(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile ("syscall"
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
            : .{ .rcx = true, .r11 = true });
    } else {
        asm volatile ("syscall"
            :
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
            : .{ .rcx = true, .r11 = true });
    }
}

fn syscall4(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile ("syscall"
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
            : .{ .rcx = true, .r11 = true });
    } else {
        asm volatile ("syscall"
            :
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
            : .{ .rcx = true, .r11 = true });
    }
}

fn syscall5(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile (
            \\ subq $48, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ syscall
            \\ addq $48, %%rsp
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
              [arg5] "ri" (arg5),
            : .{ .rcx = true, .r11 = true, .memory = true });
    } else {
        asm volatile (
            \\ subq $48, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ syscall
            \\ addq $48, %%rsp
            :
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
              [arg5] "ri" (arg5),
            : .{ .rcx = true, .r11 = true, .memory = true });
    }
}

fn syscall6(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile (
            \\ subq $56, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ syscall
            \\ addq $56, %%rsp
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
              [arg5] "ri" (arg5),
              [arg6] "ri" (arg6),
            : .{ .rcx = true, .r11 = true, .memory = true });
    } else {
        asm volatile (
            \\ subq $56, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ syscall
            \\ addq $56, %%rsp
            :
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
              [arg5] "ri" (arg5),
              [arg6] "ri" (arg6),
            : .{ .rcx = true, .r11 = true, .memory = true });
    }
}

fn syscall7(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile (
            \\ subq $64, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ syscall
            \\ addq $64, %%rsp
            : [ret] "={rax}" (-> usize),
            : [number] "{rax}" (number),
              [arg1] "{r10}" (arg1),
              [arg2] "{rdx}" (arg2),
              [arg3] "{r8}" (arg3),
              [arg4] "{r9}" (arg4),
              [arg5] "ri" (arg5),
              [arg6] "ri" (arg6),
              [arg7] "ri" (arg7),
            : .{ .rcx = true, .r11 = true, .memory = true });
    } else {
        asm volatile (
            \\ subq $64, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ syscall
            \\ addq $64, %%rsp
            :
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
}

fn syscall8(
    comptime has_return: bool,
    number: usize,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
    arg8: usize,
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile (
            \\ subq $72, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ movq %[arg8], 64(%%rsp)
            \\ syscall
            \\ addq $72, %%rsp
            : [ret] "={rax}" (-> usize),
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
    } else {
        asm volatile (
            \\ subq $72, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ movq %[arg8], 64(%%rsp)
            \\ syscall
            \\ addq $72, %%rsp
            :
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
}

fn syscall9(
    comptime has_return: bool,
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
) if (has_return) usize else void {
    if (has_return) {
        return asm volatile (
            \\ subq $80, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ movq %[arg8], 64(%%rsp)
            \\ movq %[arg9], 72(%%rsp)
            \\ syscall
            \\ addq $80, %%rsp
            : [ret] "={rax}" (-> usize),
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
    } else {
        asm volatile (
            \\ subq $80, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ movq %[arg8], 64(%%rsp)
            \\ movq %[arg9], 72(%%rsp)
            \\ syscall
            \\ addq $80, %%rsp
            :
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
}

fn syscall10(
    comptime has_return: bool,
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
) if (has_return) usize else void {
    if (has_return) {
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
            : [ret] "={rax}" (-> usize),
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
    } else {
        asm volatile (
            \\ subq $88, %%rsp
            \\ movq %[arg5], 40(%%rsp)
            \\ movq %[arg6], 48(%%rsp)
            \\ movq %[arg7], 56(%%rsp)
            \\ movq %[arg8], 64(%%rsp)
            \\ movq %[arg9], 72(%%rsp)
            \\ movq %[arg10], 80(%%rsp)
            \\ syscall
            \\ addq $88, %%rsp
            :
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
}

fn syscall11(
    comptime has_return: bool,
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
) if (has_return) usize else void {
    if (has_return) {
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
            : [ret] "={rax}" (-> usize),
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
    } else {
        asm volatile (
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
            :
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
}

pub fn syscall(comptime has_return: bool, number: usize, args: anytype) if (has_return) usize else void {
    return switch (args.len) {
        0 => syscall0(has_return, number),
        1 => syscall1(has_return, number, args[0]),
        2 => syscall2(has_return, number, args[0], args[1]),
        3 => syscall3(has_return, number, args[0], args[1], args[2]),
        4 => syscall4(has_return, number, args[0], args[1], args[2], args[3]),
        5 => syscall5(has_return, number, args[0], args[1], args[2], args[3], args[4]),
        6 => syscall6(has_return, number, args[0], args[1], args[2], args[3], args[4], args[5]),
        7 => syscall7(has_return, number, args[0], args[1], args[2], args[3], args[4], args[5], args[6]),
        8 => syscall8(has_return, number, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]),
        9 => syscall9(has_return, number, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]),
        10 => syscall10(has_return, number, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]),
        11 => syscall11(has_return, number, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]),
        else => @compileError("too many arguments"),
    };
}
