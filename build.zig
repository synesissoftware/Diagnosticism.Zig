const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create a module for other packages to import
    const diagnosticism_module = b.addModule("diagnosticism", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Static library using the module
    const lib = b.addLibrary(.{
        .name = "diagnosticism",
        .linkage = .static,
        .root_module = diagnosticism_module,
    });
    b.installArtifact(lib);

    // Unit tests using the module
    const lib_unit_tests = b.addTest(.{
        .root_module = diagnosticism_module,
    });
    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);

    // Example: show_version
    const example = b.addExecutable(.{
        .name = "show_version",
        .root_module = b.createModule(.{
            .root_source_file = b.path("examples/show_version.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    example.root_module.addImport("diagnosticism", diagnosticism_module);
    b.installArtifact(example);

    const run_example = b.addRunArtifact(example);
    // Zig 0.17 forwards `zig build run -- …` through `addPassthruArgs`.
    // Zig 0.16 still exposes those arguments as `b.args`.
    if (comptime @hasDecl(std.Build.Step.Run, "addPassthruArgs")) {
        run_example.addPassthruArgs();
    } else if (b.args) |args| {
        run_example.addArgs(args);
    }

    const run_example_step = b.step("run-example", "Run the show_version example");
    run_example_step.dependOn(&run_example.step);
}
