# lumo-desktop-bin (AUR)

AUR package for [Lumo Desktop](https://proton.me/lumo), Proton's
privacy-first AI assistant - installed from the official binaries.

Upstream distributes Linux builds only as `.deb` and `.rpm`; this package
repacks the official `.deb`. The Tauri auto-updater built into the app is not
functional for native (non-AppImage) Linux packages, so updates come through
pacman.

## Building / installing

    makepkg -si

or with an AUR helper:

    yay -S lumo-desktop-bin

## Updating to a new upstream version

Proton publishes release metadata (signed, includes the sha512 of each file):

    curl -s https://proton.me/download/lumo/desktop/linux/v1/version.json

1. Bump `pkgver` in `PKGBUILD`, reset `pkgrel=1`.
2. Update the `sha512sums` entry: run `updpkgsums`, or download the `.deb`
   and cross-check its `sha512sum` against the `Sha512CheckSum` field in
   `version.json` before publishing.
3. Regenerate `.SRCINFO`:

       makepkg --printsrcinfo > .SRCINFO

4. Commit and push:

       git add -A && git commit -m "Update to 0.5.10" && git push

## Layout notes

- The `.deb` contains a native Tauri binary at `/usr/bin/lumo-desktop`,
  a `.desktop` file with a `proton-lumo://` deep-link handler, and hicolor
  icons - `package()` extracts its `data.tar.gz` straight into `pkgdir`.
- Dependency mapping from the `.deb`:
  - `libwebkit2gtk-4.1-0` -> `webkit2gtk-4.1`
  - `libgtk-3-0` -> `gtk3`
  - `libayatana-appindicator3-1` -> `libayatana-appindicator`
- The `.deb` recommends a keyring daemon (`gnome-keyring | kwalletd6 |
  kwalletd5`); both Arch alternatives provide `org.freedesktop.secrets`
  and are listed as `optdepends`.
- Upstream source (GPL-3.0): <https://github.com/ProtonLumo/lumo-desktop>
