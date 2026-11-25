//! Name-and-scaffold stake for **Diagnosticism**, for Zig.
//!
//! The public surface is the package version. Later releases add the
//! diagnostic facilities.

/// Package version.
pub const VERSION = "0.0.0";

const std = @import("std");
const testing = std.testing;

test "version" {
    try testing.expectEqualStrings("0.0.0", VERSION);
}
