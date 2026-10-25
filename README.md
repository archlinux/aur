# qemu-apple-t8030-git

An unofficial Arch package of a QEMU fork that emulates the Apple **t8030** SoC
(iPhone 11, n104ap). It is built from [ChefKissInc/Inferno](https://github.com/ChefKissInc/Inferno)
`master` and is not affiliated with or endorsed by ChefKiss or the Inferno team.

**Set up your VM with the official guide: <https://chefkiss.dev/applehax/inferno/>.**
This package ships no firmware, keys, SEP ROM, IPSW or disk images, does not
download any, and has no restore, patching or setup scripts. It only runs an
install you made yourself by following the guide.

## What's in it

| Path | What it is |
|---|---|
| `/opt/qemu-apple-t8030/` | the emulator (`bin/qemu-system-aarch64`, aarch64-softmmu only) and its data. It sits beside the system `qemu` packages and doesn't conflict with them. |
| `/usr/bin/qemu-apple-t8030` | launcher (GTK window, `--headless`, `--companion`, `--snapshot`; `--help`) |
| `/usr/bin/qemu-apple-t8030-set-boot-splash` | set your own boot splash picture |
| `/usr/share/doc/qemu-apple-t8030-git/vm-args.example.sh` | example machine arguments with placeholder file names |
| menu entry "QEMU t8030" | Games / Emulators |

## Setting up your folder

The launcher looks in `${XDG_DATA_HOME:-~/.local/share}/qemu-apple-t8030/`
(or `$QEMU_T8030_DIR`):

    qemu-apple-t8030/
      data/          your restored install from the guide (disk images, tickets, Restore/ ...)
      private/       optional: your SEP ROM / firmware, if vm-args.sh points here
      vm-args.sh     your machine arguments: copy vm-args.example.sh and fix the file names
      boot-splash.png  optional, made by qemu-apple-t8030-set-boot-splash
      companion.sh   optional, started by --companion
      logs/          sockets (monitor, QMP, serial) and the serial log

`vm-args.sh` is a bash fragment, sourced from inside `data/` with `D` set to the
folder above, and it must fill the `MAINARGS` array. Don't set `Q` in it: the
launcher always uses the packaged emulator (`QEMU_T8030_BIN` overrides that).

If the folder or `vm-args.sh` is missing, the launcher says so and exits (in a
dialog when it was started from the menu).

## Running

    qemu-apple-t8030                 # GTK window at 0.65x, centred on the primary monitor
    qemu-apple-t8030 --headless      # no window (-display egl-headless); drive it over QMP
    qemu-apple-t8030 --snapshot      # throw away all disk writes on exit
    qemu-apple-t8030 --name X --scale 0.8 -- -d guest_errors   # extra QEMU args after --

- The window title is `QEMU t8030 (<name>)`. On KDE Plasma (Wayland) the window
  is centred with `kdotool` and `kscreen-doctor`, since Wayland apps can't place
  themselves. Elsewhere it opens wherever the compositor puts it.
- Sockets are in `logs/`: `mon-main.sock` (HMP monitor), `qmp-main.sock` (QMP),
  `serial-main.sock` (serial console; the log is `serial-main.log`).
  `QEMU_T8030_RUNDIR` moves them.
- `--companion` runs your `companion.sh` (or `$QEMU_T8030_COMPANION`) first, then
  waits for `$QEMU_T8030_USB_SOCK` if you set it. The companion VM provides the
  USB link used by the idevice* tools. It needs an **x86_64** build of the same
  fork (for the `usb-tcp-remote` device), which this package doesn't include.

### Controls

| Input | Button |
|---|---|
| left click / drag | finger (tap / swipe) |
| middle click | Home (double = app switcher) |
| F1 | force shutdown |
| F2 | ringer switch |
| F3 / F4 | volume down / up |
| F5 | side / power |
| F6 | Home (twice = app switcher) |

- The first one or two key presses after boot are ignored (upstream issue #247),
  so tap F3 or F4 once first.
- Slide to power off: hold F4, then about half a second later also hold F5.

### Never

Never set a passcode, never enable Location Services, and never use "Erase All
Content and Settings". The last one bricks the install.

## Boot splash

The emulator draws a picture before the guest OS starts. This package ships a
plain neutral one. To use your own:

    qemu-apple-t8030-set-boot-splash picture.png     # fitted onto a 1024x1024 black square
    qemu-apple-t8030-set-boot-splash --github USER   # your GitHub avatar
    qemu-apple-t8030-set-boot-splash --reset         # back to the packaged one

This writes `boot-splash.png` into your folder. The launcher hands it to the
emulator through `QEMU_T8030_BOOT_SPLASH` (a small patch in this package). It
must be an 8-bit RGBA PNG; the tool makes sure of that.

## How it differs from upstream

- **Branding.** Upstream's `ui/icons/CKBrandingNotice.md` says the splash artwork
  is © ChefKiss and the "ChefKiss Inferno" name is theirs, and that derivative
  builds must remove both. So this build:
  - replaces the splash artwork with a neutral picture;
  - uses "QEMU t8030" in the window titles (GTK, SDL, VNC, D-Bus, SPICE) and the
    `--version` banner;
  - changes the version prefix (`t8030-1.0.0rc1_QEMU-...`).

  The upstream copyright lines are kept.
- **Patches:**
  - `0001-mt-spi-middle-click-home.patch`: the middle mouse button acts as Home
    (it sends F6).
  - `0002-boot-splash-env-override.patch`: adds `QEMU_T8030_BOOT_SPLASH`. A
    splash that isn't 8-bit RGBA is skipped instead of overflowing the buffer.
- **Build:**
  - Built with gcc. A clang/lld toolchain can't link the LTO-built `liblzfse.a`.
  - `aarch64-softmmu` only.
  - **Debug info kept (`-Ddebug=true`).** With `debug=false`, meson adds
    `-DNDEBUG`. Upstream's `assert_cmp*` macros then compile out code that has
    side effects, and restores fail with "SEP returned zero-length ART". The
    PKGBUILD refuses to build if `NDEBUG` ends up set.
  - The `util/mlib` git submodule and the `keycodemapdb` meson subproject come in
    as makepkg sources. Configure runs with `--disable-download`, so the build
    itself fetches nothing.

## Licences

- Emulator: GPL-3.0, and AGPL-3.0 for the fork's own code (see upstream `LICENSE`).
  It is installed to `/usr/share/licenses/qemu-apple-t8030-git/` along with
  `CKBrandingNotice.md`.
- Launcher, splash tool, example and icon: MIT.
