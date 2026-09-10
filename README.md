# tang-dynasty-bin

Arch Linux / AUR packaging for Anlogic Tang Dynasty **Release 2026.1 SP3**
(upstream build **6.2.2.210004**).

## Build and install

1. Sign in at <https://www.anlogic.com/support/tools-downloads> with an account
   entitled to download the software. Select **软件工具 → TD Linux → TD_6.2**.
2. Download `TD_Release_2026.1_SP3_NL.zip` and put it beside `PKGBUILD`.
   Upstream SHA-256:
   `314b621cb6fc4164c245b29e78e36a22f386a5248c03502b800a37e230628280`.
3. Run as a regular user:

   ```sh
   makepkg -si
   ```

Launch **Tang Dynasty** from the application menu, or use
`tang-dynasty -gui`. Check the release with `tang-dynasty -version`.
Command-line arguments, including Tcl script paths, are passed unchanged.
The upstream CLI mishandles script paths containing spaces; use a path without
spaces when passing a Tcl script on the command line.

## Packaging notes

- The package version follows the upstream release name so service packs are
  distinguishable even though their internal versions all start with 6.2.2.
- The ZIP uses a `local://` manually supplied source because the official
  download is gated. This lets AUR accept the recipe without storing the ZIP.
  Upload only the packaging files to AUR; do not upload the vendor ZIP, extracted
  files, built packages, or a source tarball containing the ZIP.
- The archive contains no software license text; its `license/` directory is
  empty. `LicenseRef-proprietary` records this without inventing license terms.
  The bundled manuals retain their original copyright notices.
- Files live under `/opt/tang-dynasty-bin`, owned by root. The vendor's Qt and
  ICU libraries are kept, while the C++ runtime comes from Arch. Qt plugins
  whose required Qt modules are missing from the archive are omitted.
  Absolute library search paths left over from the vendor's build host are
  removed with `patchelf`.
- The launcher uses X11 and isolates Qt plugin/theme settings. Install
  `xorg-xwayland` for a Wayland desktop.
- The Anlogic USB device `0547:1002` is accessible to the active local session
  through `uaccess`. Reconnect the cable after installation. No `plugdev` group
  or world-writable USB permissions are needed. Headless/remote access requires
  an administrator's separate local access policy.

After editing packaging sources, update their SHA-256 checksums and regenerate
metadata with `makepkg --printsrcinfo > .SRCINFO`.

`namcap` still reports upstream binary hardening/stripping warnings, the use of
`/opt`, and the absent upstream license text. Its Qt dependency analysis does
not account for the vendor launcher's private library path; system `qt5-base`
is intentionally not a dependency. These should be reviewed as binary-package
limitations rather than hidden by adding an unrelated license or system Qt.
