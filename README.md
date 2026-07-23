# devin-desktop

Binary pre-built version of [Devin Desktop](https://devin.ai/desktop), a team of agents for every engineer.

## About this package

This package provides the binary version of Devin Desktop, downloaded directly from the official releases.

## Installation

### From AUR (once published)

```bash
paru -S devin-desktop-bin
# or
yay -S devin-desktop-bin
```

### Manual installation

```bash
git clone https://aur.archlinux.org/devin-desktop-bin.git
cd devin-desktop-bin
makepkg -si
```

## Updating the package

To update this package to a new version:

1. Get the latest version info from the API:
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

- **Installation directory**: `/opt/devin-desktop`
- **Executable**: `/usr/bin/devin-desktop` (symlink to `/opt/devin-desktop/devin-desktop`)
- **Desktop entry**: `/usr/share/applications/devin-desktop.desktop`
- **Icon**: `/usr/share/icons/hicolor/scalable/apps/devin-desktop.svg`

## Dependencies

- `glibc>=2.28`
- `gcc-libs`
- `gtk3`
- `nss`
- `mesa`
- `alsa-lib`
- `libsecret`
- `libxss`
- `libxtst`
- `xdg-utils`
- `libxkbcommon`
- `dbus`
- `expat`
- `libcups`
- `util-linux-libs`

## Optional dependencies

- `libnotify`: Desktop notifications
- `org.freedesktop.secrets`: Keyring support
- `libdbusmenu-glib`: KDE global menu
- `gtk2`: GTK2 theme support
- `gvfs`: Trash functionality

## License

This package follows the same license as Devin Desktop (LicenseRef-Devin Desktop).

## Maintainer

This package is maintained independently from the official Devin Desktop distribution.
