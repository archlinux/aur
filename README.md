# OpenCode Desktop Launcher for Arch Linux

A launcher-only AUR package for the self-updating official OpenCode AppImage.
Maintainer: An Nguyen <an@linux.com>.

Upstream: https://opencode.ai

AUR: https://aur.archlinux.org/packages/opencode-desktop-launcher

Release metadata: https://opencode.ai/update/api/latest/desktop/opencode

## Install and run

```sh
makepkg -si
opencode-desktop
```

Run makepkg and the launcher as your regular user. Pacman installs the system
integration and dependencies; the launcher refuses to run as root.

On first launch, the wrapper reads the official release metadata, downloads the
latest x86_64 AppImage over HTTPS, verifies its SHA-256 checksum, and atomically
installs it at:

```text
${XDG_DATA_HOME:-$HOME/.local/share}/opencode-desktop-launcher/OpenCode.AppImage
```

The first launch needs internet access. Failed or interrupted downloads are not
installed. A lock serializes simultaneous first launches. Subsequent launches run
the existing user-owned AppImage without downloading or overwriting it, so the
application can use its own updater without administrator access. Arguments are
forwarded unchanged. The AppImage retains upstream's bundled Electron and CLI.

## Versioning and ownership

`pkgver` is the launcher version, not the OpenCode application version. Update
this package when its launcher, dependencies, icon, or desktop integration
changes. Ordinary OpenCode releases are handled by the application's updater.

Pacman owns these files:

- `/usr/bin/opencode-desktop`
- `/usr/share/applications/ai.opencode.desktop.desktop`
- `/usr/share/icons/hicolor/256x256/apps/ai.opencode.desktop.png`
- `/usr/share/licenses/opencode-desktop-launcher/LICENSE`
- `/usr/share/licenses/opencode-desktop-launcher/LICENSE-opencode`
- `/usr/share/doc/opencode-desktop-launcher/README.md`

The user owns the downloaded application. Removing or upgrading this package
leaves that application and the user's OpenCode data intact. To reset the
application download, close OpenCode and remove only its `OpenCode.AppImage`
file; the next launch downloads the current official release again.

The launcher and packaging documentation use the 0BSD license. The official
icon is pinned to an upstream commit and accompanied by OpenCode's MIT license.
No application binary is included in the Arch package, and no checksum is
skipped for its build sources.

## Desktop integration and existing installations

The desktop entry filename deliberately contains `.desktop` twice: OpenCode's
app ID is `ai.opencode.desktop`, followed by the desktop file extension. The
icon name and `StartupWMClass` match that app ID for Wayland taskbar matching.
System desktop and icon cache updates are left to pacman's normal hooks.

A user-level desktop entry with the same filename overrides the system entry.
If you previously created one for an AppImage under `/opt/local/opencode/bin/`,
move it aside after installing this package:

```sh
mkdir -p ~/.local/share/opencode-launcher-backup
mv -n ~/.local/share/applications/ai.opencode.desktop.desktop \
  ~/.local/share/opencode-launcher-backup/
kbuildsycoca6
```

Close the desktop app, remove its old taskbar pin, launch OpenCode from the
application menu, and pin it again. The package does not change home files or
KDE settings automatically.

This package provides the desktop command and conflicts with alternative
OpenCode desktop packages. It does not conflict with `extra/opencode` or replace
`/usr/bin/opencode`. Desktop and terminal interfaces share OpenCode's default
configuration, data, state, cache, and background service; this launcher does
not isolate or modify those paths.

## Maintaining the package

Keep `pkgver` tied to launcher releases, and increment `pkgrel` for packaging
fixes. `_assets_commit` pins the official icon and upstream license; update it
when those assets need refreshing, rather than for every OpenCode release.

After changing local build sources, update their SHA-256 checksums, validate
the wrapper with ShellCheck and the desktop entry with desktop-file-validate,
build with makepkg, then regenerate `.SRCINFO`:

```sh
makepkg --verifysource
makepkg --cleanbuild
makepkg --printsrcinfo > .SRCINFO
```

Only recipe sources belong in the AUR Git repository. Download caches, package
archives, and the runtime AppImage are excluded by `.gitignore`.
