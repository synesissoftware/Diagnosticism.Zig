# Diagnosticism.Zig <!-- omit in toc -->

Name-and-scaffold stake for Diagnosticism, for Zig

![Language](https://img.shields.io/badge/Zig-F7A41D?style=flat&logo=zig&logoColor=white)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![GitHub release](https://img.shields.io/github/v/release/synesissoftware/Diagnosticism.Zig.svg)](https://github.com/synesissoftware/Diagnosticism.Zig/releases/latest)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/Diagnosticism.Zig)](https://github.com/synesissoftware/Diagnosticism.Zig/commits/master)
[![CI](https://github.com/synesissoftware/Diagnosticism.Zig/actions/workflows/ci.yml/badge.svg)](https://github.com/synesissoftware/Diagnosticism.Zig/actions/workflows/ci.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Developer Experience](#developer-experience)
- [Installation](#installation)
- [Components](#components)
- [Examples](#examples)
- [Project Information](#project-information)
  - [Where to get help](#where-to-get-help)
  - [Contribution guidelines](#contribution-guidelines)
  - [Dependencies](#dependencies)
    - [Efferent (fan-out)](#efferent-fan-out)
    - [Development Dependencies](#development-dependencies)
    - [Afferent (fan-in)](#afferent-fan-in)
  - [Related projects](#related-projects)
  - [License](#license)


## Introduction

**Diagnosticism.Zig** stakes the package name **diagnosticism** at version **0.0.0**. The public surface is the version constant.

**Diagnosticism.Zig** is the **Zig** implementation of **Diagnosticism**.


## Developer Experience

**Diagnosticism.Zig** builds with Zig **0.17.1**. It has no dependencies.

```bash
zig build test
zig build run-example
```

The smallest use imports the package and reads the version constant:

```zig
const std = @import("std");
const diagnosticism = @import("diagnosticism");

pub fn main(init: std.process.Init) !void {
    var buffer: [64]u8 = undefined;
    var stdout_impl = std.Io.File.stdout().writer(init.io, &buffer);
    const stdout = &stdout_impl.interface;

    try stdout.print("{s}\n", .{diagnosticism.VERSION});
    try stdout.flush();
}
```

That program is [examples/show_version.zig](./examples/show_version.zig). `diagnosticism.VERSION` is `"0.0.0"`.


## Installation

Add **Diagnosticism.Zig** with `zig fetch` once the **0.0.0** tag exists:

```bash
zig fetch --save https://github.com/synesissoftware/Diagnosticism.Zig/archive/refs/tags/0.0.0.tar.gz
```

That writes the URL and the hash into `build.zig.zon`:

```zig
.{
    .name = .my_project,
    .version = "0.0.0",
    .dependencies = .{
        .diagnosticism = .{
            .url = "https://github.com/synesissoftware/Diagnosticism.Zig/archive/refs/tags/0.0.0.tar.gz",
            .hash = "1220...",
        },
    },
}
```

Then import and expose the module in your `build.zig`:

```zig
const diagnosticism_dep = b.dependency("diagnosticism", .{
    .target = target,
    .optimize = optimize,
});
exe.root_module.addImport("diagnosticism", diagnosticism_dep.module("diagnosticism"));
```


## Components

**Diagnosticism.Zig** **0.0.0** exports `VERSION` only.

```zig
const diagnosticism = @import("diagnosticism");

const version = diagnosticism.VERSION;
```


## Examples

See [EXAMPLES.md](./EXAMPLES.md). Run the sample with:

```bash
zig build run-example
```


## Project Information


### Where to get help

[GitHub Page](https://github.com/synesissoftware/Diagnosticism.Zig "GitHub Page")


### Contribution guidelines

Defect reports, feature requests, and pull requests are welcome on https://github.com/synesissoftware/Diagnosticism.Zig.


### Dependencies


#### Efferent (fan-out)

None.


#### Development Dependencies

None.


#### Afferent (fan-in)

None (currently).


### Related projects

* [**Diagnosticism**](https://github.com/synesissoftware/Diagnosticism/)
* [**Diagnosticism.Go**](https://github.com/synesissoftware/Diagnosticism.Go/)
* [**Diagnosticism.NET**](https://github.com/synesissoftware/Diagnosticism.NET/)
* [**Diagnosticism.Python**](https://github.com/synesissoftware/Diagnosticism.Python/)
* [**Diagnosticism.Ruby**](https://github.com/synesissoftware/Diagnosticism.Ruby/)
* [**Diagnosticism.Rust**](https://github.com/synesissoftware/Diagnosticism.Rust/)


### License

**Diagnosticism.Zig** is released under the 3-clause BSD license. See [LICENSE](./LICENSE) for details.


<!-- ########################### end of file ########################### -->
