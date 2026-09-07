# lightburn-on-linux-git

Unofficial Wine compatibility wrapper for LightBurn 2.x. Builds the MIT shim
and native Windows launcher from the current upstream `main` branch. No
LightBurn installer, application, icon, license or Wine prefix is included.
Cameras are unsupported and laser hardware has not been tested.

## Build

On x86_64 Arch Linux, install `base-devel`, then run `makepkg -si` here as a
regular user. Runtime dependencies are `bash`, `coreutils` and `wine`.
`git` and `mingw-w64-gcc` are build dependencies. `shellcheck` and
`desktop-file-utils` are check dependencies. All are official repository packages.

`pkgver()` uses the Git commit count and abbreviated hash, initially
`0.r5.g2424aab`. This is a moving `-git` package, not a pinned release.
Only the Git source uses `SKIP`; local sources have SHA-256 checksums.
After updating packaging sources, refresh checksums and regenerate `.SRCINFO`
with `makepkg --printsrcinfo > .SRCINFO`.

## Setup

Download the official Windows installer from
[LightBurn](https://lightburnsoftware.com/pages/download-trial), review and
accept its applicable terms, and use a valid license or authorized trial.
The upstream default currently accepts 2.1.04 and verifies its recorded SHA-256.
The package never downloads or runs the installer during its build or installation.

```bash
lightburn-on-linux-setup "$HOME/Downloads/LightBurn-v2.1.04.exe"
lightburn-on-linux
lightburn-on-linux "/path/to/project.lbrn2"
lightburn-on-linux-map-serial /dev/serial/by-id/your-device com1
```

Run these commands without `sudo`. The serial command only creates a COM
symlink. Arrange device access yourself; this package installs no udev rules,
changes no groups and does not verify laser communication.

Install `xorg-xwayland` on Wayland and run from a session with `DISPLAY` set.
For headless setup, install `xorg-server-xvfb`, which also depends on `xorg-xauth`.
Launching LightBurn still needs a graphical desktop.

Setup exports the packaged DLL and launcher paths, so no compiler is needed
after installation. Run `lightburn-on-linux-setup` without an installer to repair
an existing prefix, including older prefixes missing the native launcher.
Repeat repair after package updates to copy the rebuilt helpers into your prefix.
Repair does not upgrade the proprietary application or change its version stamp.
An interrupted application installation needs its matching installer again.

Set the same absolute `WINEPREFIX` for setup, launch and serial mapping to use
an existing prefix. The packaged scripts otherwise default to
`${XDG_DATA_HOME:-$HOME/.local/share}/lightburn-on-linux/wineprefix`.
They do not discover a source checkout's `.work/wineprefix`; select it explicitly.
Back up an existing prefix before changing it.

Complete setup in a terminal before using the desktop entry. The entry uses
`Terminal=false`, so early startup errors may be invisible there. Run
`lightburn-on-linux` in a terminal to diagnose them. Wine output appends to
`run.log` and `install.log` under
`${XDG_STATE_HOME:-$HOME/.local/state}/lightburn-on-linux`.

The package provides `lightburn-on-linux` and conflicts only with that stable
package name. It does not provide or conflict with `lightburn-bin`. Commands,
desktop file and installation directories are distinct from that package.
The desktop entry uses the theme's generic `applications-graphics` icon and
registers no MIME associations.

## Checks

`check()` runs Bash syntax checks, ShellCheck, upstream mock shell tests,
wrapper argument and environment tests, strict native launcher and contract-test
compilation, PE checks and desktop validation. It never runs Wine or LightBurn.
Test executables, build scripts and test sources are not installed.

For optional real Wine contract tests, install `bubblewrap` and
`xorg-server-xvfb` alongside the build dependencies, then run from this directory:

```bash
bash src/upstream/tests/shim-com.sh
```

This tests the shim and launcher without a vendor application. It creates an
isolated prefix under the checkout's `.cache/` and requires working unprivileged
user namespaces. Nested containers or clean chroots may reject Bubblewrap's
`unshare`. Run on a suitable external test machine instead of weakening its
sandbox. These optional tools are not `checkdepends`.

Original project code is MIT. Upstream's `LEGAL.md` records unresolved vendor
EULA questions; this package does not resolve them or imply vendor approval.
The package also carries MinGW's complete runtime notices from the build
toolchain, plus GPLv3 and the GCC Runtime Library Exception. The exception
permits eligible GCC-compiled combinations to retain the independent code's
license; using the compiler does not make this wrapper GPL-only. Wine is an
external dependency, not bundled runtime code.
