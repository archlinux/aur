# whatsapp-nativefier (AUR)

Arch Linux PKGBUILD that wraps [web.whatsapp.com](https://web.whatsapp.com/) into a desktop app via [nativefier](https://github.com/nativefier/nativefier) + Electron.

- **AUR**: https://aur.archlinux.org/packages/whatsapp-nativefier
- **Source mirror**: https://gitlab.com/Nowaker/aur-whatsapp-nativefier-2

## History

Originally maintained on the AUR by Fredy García. After the package was removed from the AUR, this fork picked up maintenance. Damian Nowak is the current AUR maintainer; Fredy is listed as Contributor.

## What's in the package

- `nativefier` invocation pinned to a known-good Electron release so the WhatsApp Web UI keeps rendering. The latest WhatsApp Web CSS resolves chat text color to the same value as the chat background under older Chromium (<128), producing invisible ("ghost") text that only shows when selected. The build pins **Electron 32.3.3 / Chromium 128** to avoid that.
- `nativefier` is invoked through Node 22 via `nvm` because the bundled `electron-packager 17.1.2` + `extract-zip 2.0.1` silently exit mid Electron-zip extraction when run on Node 24+. The build function sources `~/.nvm/nvm.sh` and switches to Node 22 if available.
- WhatsApp app extras enabled out of the box: `--show-menu-bar` (so DevTools / View / Window menus are reachable), `--single-instance`, `--tray`, and `--file-download-options` with save-as dialog + download progress badge.
- `whatsapp-nativefier-inject.js` runs in the renderer, retries service-worker / cache cleanup on the "unsupported browser" landing page, and enables the spell checker over IPC.

## Build dependencies

`imagemagick`, `nodejs-nativefier`, `unzip`, plus `nvm` with Node 22 available (`nvm install 22` if you do not have it).

## Usage

```
git clone https://aur.archlinux.org/whatsapp-nativefier.git
cd whatsapp-nativefier
makepkg -si
```

Or via an AUR helper:

```
yay -S whatsapp-nativefier
```

## Reporting issues

File issues on the [GitLab mirror](https://gitlab.com/Nowaker/aur-whatsapp-nativefier-2/-/issues). The AUR page is best used for `out-of-date` flags and package-policy comments.
