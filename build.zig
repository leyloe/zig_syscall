const std = @import("std");

fn get_module(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    path: []const u8,
    name: []const u8,
) *std.Build.Module {
    return b.addModule(name, .{
        .root_source_file = b.path(path),

        .target = target,
    });
}

fn add_run_step(
    b: *std.Build,
    exe: *std.Build.Step.Compile,
) void {
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

fn create_build_options(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    imports: []const std.Build.Module.Import,
    root_source_path: []const u8,
) std.Build.Module.CreateOptions {
    var options = std.Build.Module.CreateOptions{
        .root_source_file = b.path(root_source_path),
        .target = target,
        .optimize = optimize,
        .imports = imports,
    };

    switch (optimize) {
        .Debug => {},
        .ReleaseSafe => {},
        else => {
            options.strip = true;
            options.error_tracing = false;
            options.pic = true;
        },
    }

    return options;
}

fn add_exe(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    imports: []const std.Build.Module.Import,
    name: []const u8,
    root_source_path: []const u8,
) *std.Build.Step.Compile {
    const options = create_build_options(b, target, optimize, imports, root_source_path);
    const exe_mod = b.createModule(options);

    var link_mode: ?std.builtin.LinkMode = null;
    if (target.query.abi == .msvc)
        link_mode = .static;

    const exe = b.addExecutable(.{
        .name = name,
        .root_module = exe_mod,
        .linkage = link_mode,
    });

    return exe;
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const root_module = get_module(
        b,
        target,
        "src/root.zig",
        "zig_syscall",
    );

    const imports: []const std.Build.Module.Import = &.{
        .{ .name = "zig_syscall", .module = root_module },
    };

    const exe = add_exe(b, target, optimize, imports, "zig_syscall_main", "src/main.zig");

    b.installArtifact(exe);

    add_run_step(b, exe);
}
