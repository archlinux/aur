# workbuddy-international (unofficial Linux port)

Arch Linux packaging for the **WorkBuddy AI international edition**
(https://www.workbuddy.ai) — Tencent publishes macOS/Windows clients only for
the international line, so this package converts the official macOS x64 build
into a working Linux (x86_64) application.

> Not affiliated with, endorsed by, or supported by Tencent. WorkBuddy /
> WorkBuddy AI / CodeBuddy are Tencent products. See [DISCLAIMER](DISCLAIMER).

## How it works

The international and domestic (workbuddy.cn) clients are a **single shared
codebase**; the edition is selected by a baked-in `cli/product.json`
(endpoints, auth app id, branding). The macOS build therefore contains the
full cross-platform core and only needs its platform binaries swapped:

1. Extract `WorkBuddy AI.app` from the official DMG (download URL + sha256
   come from the official update API
   `https://www.workbuddy.ai/v2/update?platform=workbuddy-darwin-x64`).
2. Replace the macOS Electron runtime with the **same version** for Linux
   (37.10.3, from the official Electron releases).
3. Rebuild native Node modules for Linux/Electron from source
   (`better-sqlite3`, `node-pty`), install Linux platform packages
   (`@lydell/node-pty-linux-x64`, `@vscode/ripgrep`).
4. Apply runtime patches where still needed (the patcher is anchor-tolerant
   and skips fixes already applied upstream; as of 5.5.2 the E2BIG
   product-config env issue and the tray-menu issue are fixed upstream, and
   the built-in Linux updater degrades gracefully to "no update channel").

The conversion toolchain (`install.sh`, `lib-*`) is vendored from the
MIT-licensed community project
[workbuddy-linux](https://github.com/JipZeonGit/workbuddy-linux)
(see `LICENSE.port-tool`), with adaptations:

- `lib-electron.sh`: honor a pre-seeded runtime zip via
  `WORKBUDDY_ELECTRON_ZIP` (lets PKGBUILD keep all downloads in `source[]`).
- `lib-apply-linux-patches.js`: every patch is now optional — missing
  anchors only warn instead of aborting, and the E2BIG env shim is prepended
  only when the `ACC_PRODUCT_CONFIG_V*` mechanism is actually present.
- Files are kept flat (`lib-*.sh`, `lib-*.js`) because AUR package
  repositories may not contain subdirectories.

## Build & install

```bash
# Dependencies: nodejs npm p7zip unzip python imagemagick (+ icoutils)
makepkg -si
```

or with an AUR helper once published:

```bash
yay -S workbuddy-international-bin
```

Launch: `workbuddy-international` or the "WorkBuddy AI (International)"
desktop entry. Sign in with the international account (Google / GitHub OAuth
on workbuddy.ai — separate from the domestic workbuddy.cn account system).

## Upgrading

No auto-update on Linux (upstream serves no international Linux feed; the
in-app checker no-ops by design). To upgrade:

1. Query the current version:
   `curl 'https://www.workbuddy.ai/v2/update?platform=workbuddy-darwin-x64'`
2. Bump `_pkgver` / `_build` / `_electronver` and the DMG sha256 in
   `PKGBUILD`, increment `pkgrel`.
3. `makepkg -si` again.

## Known limitations (upstream constraints)

- **Tencent Docs deep collaboration** — the native docs engine ships
  macOS-only binaries; basic doc create/read/edit still works via cloud APIs.
- **AI code sandbox** — no Linux build; fully-automatic code execution falls
  back to running in the real terminal or refuses with a safety notice.
- **Auto-update** — disabled by design (no international Linux channel).
- arm64 untested (patches are arch-aware, but only x86_64 is packaged here).

Do **not** report port-specific issues to Tencent support; file them in this
repository's issue tracker.
