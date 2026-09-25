# Firma4NG for Arch/CachyOS — local binary package

This is a **Firma4NG** package, not a pyHanko package. It repackages the InfoCamere
Linux archive already used in this conversation. It has not been submitted to
AUR. It does not change the separately installed `bit4id-xpki` middleware or the
NSS registrations used by Chromium, Firefox and Papers.

## Build

Keep `PKGBUILD`, `firma4ng`, `firma4ng.desktop`, and this `README.md` together.
Enable the standard Arch `[multilib]` repository for the 32-bit runtime packages.
Install the usual `base-devel` prerequisites. From this directory, as an ordinary
user, run:

```sh
makepkg --verifysource
makepkg --printsrcinfo > .SRCINFO
makepkg --cleanbuild --syncdeps
```

Stop if any step fails. Then inspect/install the package:

```sh
PKG="$(makepkg --packagelist)"
pacman -Qip "$PKG"
pacman -Qlp "$PKG"
sudo pacman -U "$PKG"
```

`makepkg` is not run with sudo. There is no compiler or Python dependency tree for
Firma4NG: the vendor binaries and their bundled runtimes are reused. The recipe
does declare native and 32-bit runtime packages; their transitive dependencies
are resolved by pacman. No additional AUR dependency is declared.

To reuse your existing download, copy `Firma4NG_linux.tar.gz` into this build
directory as `Firma4NG_linux-1.6.20.tar.gz` before running makepkg. Do not rename or
reuse the nested archive in its place. The **official outer download is gzip-compressed**.
The attachment originally inspected here had already been decompressed to a tar
without its filename changing. The user's subsequent full-stream SHA-256 check
confirmed that decompressing the official download reproduces that exact tar.
The recipe pins the compressed download, while `tar -xf` detects its compression.

## Layout and update policy — important

Pacman owns a pristine compressed application seed and a launcher:

```
/opt/firma4ng/Firma4NG.tar.gz
/opt/firma4ng/SHA256SUMS
/opt/firma4ng/seed-version
/usr/bin/firma4ng
/usr/share/applications/firma4ng.desktop
/usr/share/icons/hicolor/256x256/apps/firma4ng.png
/usr/share/licenses/firma4ng-bin/LICENSE
/usr/share/doc/firma4ng-bin/UPSTREAM-README.txt
/usr/share/doc/firma4ng-bin/README.md
```

The upstream README describes the vendor installer. **Do not run that installer
for this package.** This package uses a different, explicitly documented launch
and layout strategy.

The first launch expands the seed into:

```
${XDG_DATA_HOME:-$HOME/.local/share}/firma4ng/app
```

That application tree is owned by your user and is writable **only by that
user**. Approximately 279 MB of uncompressed file data is needed for the original
runtime in addition to the approximately 120 MB compressed seed. The default
location is `~/.local/share/firma4ng/app`.

This division lets the vendor application updater continue operating without
requiring root or letting an ordinary user change pacman-owned files. The TSL/
trusted-root updater and all vendor update settings are preserved. Existing
`~/.bit4id/firma4ng` data are left in place. Vendor code may also use other
home-directory caches and temporary/runtime locations.

**Pacman manages the seed and launcher, not the self-updated runtime.**
`pacman -Q firma4ng-bin` reports the packaged seed version, which is not a reliable
report of the version of a self-updated application. Package upgrades never
silently overwrite an existing runtime. They update the seed for new runtimes.
Inspect the application's own About dialog for its running version.

This is a deliberate compromise to preserve the working updater workflow; it is
not a fully immutable, entirely pacman-managed application installation.

## Reuse your already-updated application — recommended for this machine

Before the first launch, close every Firma4NG window and its updater. Then:

```sh
firma4ng --import "$HOME/Applications/Firma4NG-1.6.20"
firma4ng
```

Import copies that complete application tree into the runtime directory, leaves
the original untouched, and exits without executing Firma4NG. It preserves the
already-downloaded application updates rather than resetting to the older seed.
It does not separately copy home-level caches because the same user will keep
using them. File contents are copied unchanged; permissions are restricted to
the current user. Import refuses to overwrite an existing runtime.

The imported contents are **not** checked against the original archive hash:
they are your explicitly selected, already-updated installation. Close the
application before copying so the source is not changing during the import.

Without an import, `firma4ng` starts with the packaged seed on its first launch.
It may then run the vendor update checks. Do not assume a fresh copy plus old
updater state equals the already-working, updated application; importing that
working tree is the preferable migration here.

## Usage

```sh
firma4ng                         # full graphical application
firma4ng --verify /path/file.pdf  # open a file for verification
firma4ng /path/file.p7m           # same as --verify
firma4ng --show-path              # display runtime path; no vendor execution
```

The GNOME application entry is `Firma4NG`. The desktop entry also offers an
Open With handler for PDFs and PKCS#7 files; the package does not set it as your
default viewer.

The launcher sets the Python/library environment used in our successful portable
launch and calls `kickstart.exe` directly. It does **not** execute `setup.run`,
`launcher_linux.com`, `kickstart.bat`, or `start_hid.bat`. This intentionally skips
the launch-time HID permission-changing helper, since the miniLector already
works through PC/SC. It is not a general installer for every HID-only token.
Other vendor functions can still invoke their own helpers; this is not a sandbox.

Firma4NG retains its own 32-bit Bit4id library inside its private tree. Do not
replace it with the 64-bit `/usr/lib/bit4id/libbit4xpki.so` used by Chromium/Papers.
The main GUI uses the bundled Qt 4 libraries, so no AUR Qt 4 package is declared.
On GNOME Wayland, Xwayland must be available for this legacy X11 application.
The package neither enables nor restarts PC/SC; the existing setup is preserved.

## Upstream source and checksums

Official InfoCamere listing:
https://id.infocamere.it/documentazione/it/software_di_firma.html

Download:
https://id.infocamere.it/assets/software/Firma4NG_linux.tar.gz

Official gzip download SHA-256 (confirmed by the user's local verification):
`36d39e7ca23f54e392d344901c02de5168b6700c20c2a8ca51a77d0f77811c14`

Decompressed outer tar SHA-256 (the original uploaded attachment):
`4a487d568a979666e3c7d17405d9f04bbef8c67c027119b13f955daf3872a12d`

Nested seed SHA-256:
`39807b7e667514874c6ca54fc2567fe4056491f6ec7766b0ed56a2f7377491bb`

The compressed-download hash and its decompressed-stream match were reported in
the user's terminal output. The decompressed-tar and nested-seed hashes were
computed from the inspected attachment. These are not manufacturer-signed
checksums. The URL is unversioned. A changed download
must be inspected and versioned appropriately; do not bypass a checksum failure.
No vendor archive, binary, icon, or font is redistributed with these build files.
They are obtained from the official upstream archive when you build.

The installed `LICENSE` is the original `licenza.txt`, unmodified. Read it before
using the proprietary software. This recipe does not relicense the vendor code.

## Security and testing limits

The package does not modernize the legacy Python/Qt/OpenSSL runtimes in the
vendor bundle. The inspected `installer.conf` files use an HTTP updater URL:
`http://infocamere.firma4update.bit4id.com/linux`. That configuration is preserved,
not silently rewritten. The update-signature implementation has not been audited.
The build-time pinned hash does not authenticate later updater downloads.

No system-wide CA trust import, new NSS registration, udev rule, global library
alias, package-specific install hook, or permission broadening is performed.
Never launch this application or its updater with sudo.

See `VALIDATION.txt` in the build-files archive for the tests performed. The full
native makepkg/clean-chroot build, installed GUI, updater and card workflows were
not run in the packaging environment. Declared dependencies cover the identified
basic GUI and PC/SC paths, not a claim that every dormant legacy/cloud component
in this large vendor bundle has a fully resolved dependency graph.

## Removal and deliberate runtime replacement

```sh
sudo pacman -R firma4ng-bin
```

This removes only package-owned files, not your runtime, existing portable copy,
Bit4id user settings, trust-list caches, signed documents, or `bit4id-xpki`.

To deliberately initialize a new runtime from a future seed, close Firma4NG and
back up or rename the directory shown by `firma4ng --show-path` first. Do not
remove home-level Bit4id data as an automatic troubleshooting step. No destructive
reset command is supplied by this launcher.
