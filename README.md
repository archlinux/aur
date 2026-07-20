# uuyc — NetEase UU Remote / 网易UU远程

`uuyc` packages the NetEase UU Remote (网易UU远程) Windows client for Arch Linux and runs it in a dedicated Wine prefix. It installs the official upstream installer, prepares Microsoft Edge WebView2 Runtime, configures the required Wine compatibility settings, and starts the UU Remote server before the desktop client.

This is an unofficial compatibility package. NetEase does not support this Wine setup.

## Installation

Install from the AUR with an AUR helper:

```bash
paru -S uuyc
```

Or build the package manually:

```bash
git clone https://aur.archlinux.org/uuyc.git
cd uuyc
makepkg -si
```

## First launch

Start **NetEase UU Remote** from the application menu or run:

```bash
uuyc
```

The first launch can take several minutes. The launcher creates a 64-bit Wine prefix, installs UU Remote and WebView2 Runtime, verifies the installation, and then starts the application.

The default per-user paths are:

```text
Wine prefix:  ${XDG_DATA_HOME:-$HOME/.local/share}/uuyc/wineprefix
Setup state:  ${XDG_STATE_HOME:-$HOME/.local/state}/uuyc
Setup log:    ${XDG_STATE_HOME:-$HOME/.local/state}/uuyc/setup.log
```

If `$HOME/Games/uu-remote` already contains a valid UU Remote installation, the launcher reuses that legacy prefix. Set `UUYC_WINEPREFIX` to select a different prefix explicitly.

## Launcher options

```text
uuyc [OPTION] [CLIENT_ARGUMENT...]

--repair       Recheck and repair the Wine prefix before launching
--setup-only   Prepare the Wine prefix without launching UU Remote
--uri URI      Open a uuremote: URI through Wine's registered handler
--version      Print the AUR package release
-h, --help     Show command-line help
```

Examples:

```bash
uuyc --setup-only
uuyc --repair
uuyc --uri 'uuremote:...'
```

The desktop entry registers `uuyc.desktop` as the `uuremote:` URI handler.

## Wine configuration

The launcher applies and verifies the compatibility settings required by UU Remote:

- a 64-bit Wine prefix configured as Windows 10;
- Microsoft Edge WebView2 Runtime from the bundled upstream installer;
- a Windows 8 application override limited to `msedgewebview2.exe`;
- `UseTakeFocus=N` for Wine's X11 driver;
- an enabled `GameViewerService` service;
- `GameViewerServer.exe` started before `GameViewer.exe`;
- Wine menu generation disabled so the upstream installer cannot replace the packaged desktop and URI entries;
- a prefix-local Windows Desktop directory so the installer cannot write shortcuts into the host desktop.

The installed Windows application remains under the per-user prefix because UU Remote includes its own updater and writes runtime data beside the application.

## Troubleshooting

Run a full prefix check and repair:

```bash
uuyc --repair
```

Inspect the setup log:

```bash
less "${XDG_STATE_HOME:-$HOME/.local/state}/uuyc/setup.log"
```

Useful version information:

```bash
uuyc --version
wine --version
```

When reporting a problem, include the package release, Wine version, the relevant setup log section, and whether a custom `UUYC_WINEPREFIX` is in use. Do not publish account credentials, device identifiers, remote-assistance codes, or complete application logs without reviewing them first.

## Uninstallation

Remove the system package with pacman or an AUR helper:

```bash
paru -Rns uuyc
```

Pacman intentionally does not delete per-user Wine data. To remove the default prefix after closing UU Remote, first stop its Wine server and then delete the package-owned user directories:

```bash
WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/uuyc/wineprefix" wineserver -k
rm -rf -- \
  "${XDG_DATA_HOME:-$HOME/.local/share}/uuyc" \
  "${XDG_STATE_HOME:-$HOME/.local/state}/uuyc"
```

Verify the paths before running the removal command. A custom `UUYC_WINEPREFIX` or the legacy `$HOME/Games/uu-remote` prefix is not removed by those commands.

## Maintainer release workflow

GitHub is the development repository and uses the `main` branch. The AUR repository remains a separate Git repository whose required branch is `master`.

`.github/workflows/aur-publish.yml` publishes the checked-in package recipe to AUR when package files change on `main`, and it can also be started manually with `workflow_dispatch`. The workflow deliberately does not derive `pkgver`, the installer URL, or checksums from a Git tag. Every upstream update must be validated in this repository before it is pushed to `main`.

The GitHub repository must define this Actions secret:

```text
AUR_SSH_PRIVATE_KEY
```

Its value is the complete private SSH key whose public key is registered for an AUR account that owns or co-maintains `uuyc`. Never commit that key to either repository.

For an upstream update:

1. Update `pkgver`, reset `pkgrel` to `1`, and update the installer URL and checksums in `PKGBUILD`.
2. Update the launcher checksum if `uuyc` changed.
3. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
4. Run the local syntax, desktop-entry, source, package-build, and launch checks.
5. Commit the verified files and push `main` to GitHub.
6. Confirm that the **Publish to AUR** workflow completed and inspect the resulting AUR commit.

For packaging-only behavioral changes, keep `pkgver` and increment `pkgrel`.

## License

UU Remote is proprietary software distributed under the upstream UU Remote EULA. The EULA is downloaded from the official website during the package build and installed under `/usr/share/licenses/uuyc/`.

The AUR packaging files in this repository are licensed under the [0BSD license](LICENSE), as declared by `REUSE.toml`.
