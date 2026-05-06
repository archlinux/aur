# windsurf-bin

Binary pre-built version of [Windsurf](https://windsurf.com/), the new purpose-built IDE to harness magic.

## About this package

This package provides the binary version of Windsurf Editor, downloaded directly from the official Windsurf releases. It conflicts with the `windsurf` package to avoid conflicts.

## Installation

### From AUR (once published)

```bash
paru -S windsurf-bin
# or
yay -S windsurf-bin
```

### Manual installation

```bash
git clone https://aur.archlinux.org/windsurf-bin.git
cd windsurf-bin
makepkg -si
```

## Updating the package

To update this package to a new Windsurf version:

1. Get the latest version info from the Windsurf API:
   ```bash
   curl -s https://windsurf-stable.codeium.com/api/update/linux-x64/stable/latest
   ```

2. Extract the download URL and SHA256 hash from the JSON response:
   ```bash
   curl -s https://windsurf-stable.codeium.com/api/update/linux-x64/stable/latest | jq -r '.url, .sha256hash'
   ```

3. Update the PKGBUILD:
   - Update `pkgver` with the new version (from `windsurfVersion` field)
   - Update `_url` with the new download URL
   - Update `sha256sums` with the new SHA256 hash

4. Generate the new .SRCINFO:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

5. Commit and push the changes:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to version X.X.X"
   git push
   ```

## Package details

- **Installation directory**: `/opt/windsurf-bin`
- **Executable**: `/usr/bin/windsurf` (symlink to `/opt/windsurf-bin/windsurf`)
- **Desktop entry**: `/usr/share/applications/windsurf.desktop`
- **Icon**: `/usr/share/pixmaps/windsurf.png`

## Dependencies

- `glibc>=2.28`
- `gcc-libs`
- `gtk3`
- `nss`
- `libgbm`
- `libxkbcommon`
- `libdrm`
- `alsa-lib`
- `libnotify`
- `libsecret`
- `libxss`
- `libxtst`
- `xdg-utils`

## Optional dependencies

- `glib2`: Move to trash functionality
- `org.freedesktop.secrets`: Sync settings (e.g., gnome-keyring, pass)
- `libdbusmenu-glib`: KDE global menu

## License

This package follows the same license as Windsurf Editor (LicenseRef-Windsurf Editor).

## Maintainer

This package is maintained independently from the official `windsurf` AUR package.
