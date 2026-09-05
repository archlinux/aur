# open-design-desktop (AUR)

Arch Linux AUR package for [Open Design](https://github.com/nexu-io/open-design), the open-source Claude Design alternative and local-first AI design studio for coding agents (DeepSeek Harness, Claude Code, Codex, Cursor, etc.).

## Package Overview

| Field | Value |
|---|---|
| **Package Name** | `open-design-desktop` |
| **Upstream Version** | `0.21.1` |
| **Upstream Repository** | [nexu-io/open-design](https://github.com/nexu-io/open-design) |
| **License** | Apache-2.0 |
| **Architecture** | `x86_64` |
| **Provides** | `open-design`, `open-design-desktop` |
| **Conflicts** | `open-design`, `open-design-git` |

### Why `open-design-desktop`?

- The existing AUR package **`open-design`** (maintained by `Refreeze5911`) packages only the background daemon and static web UI, with no Electron window, desktop GUI, or `.desktop` launcher.
- The AUR package **`open-design-git`** (maintained by `motherofmilk`) is a stale VCS package stuck at version 0.5.0 from May 2026.
- **`open-design-desktop`** builds and packages the complete native Electron desktop application from the latest stable release tag (`open-design-v0.21.1`), providing full system integration with application menu shortcuts, icon, and URL scheme handling.

## Files Included

- `PKGBUILD`: Build recipe using upstream's `tools-pack linux build` pipeline.
- `.SRCINFO`: AUR metadata generated via `makepkg --printsrcinfo`.
- `open-design-desktop.desktop`: Freedesktop desktop entry for application menus.
- `open-design-desktop.sh`: Wrapper script managing XDG environment paths and launching the AppDir.
- `.gitignore`: Prevents tarballs and build directories from polluting the git repository.

## Installation

### Local Build & Install
```bash
# Clone or navigate to this directory
cd /home/dev/.gemini/antigravity/scratch/open-design-desktop

# Build and install dependencies + package
makepkg -si
```

### Publishing to AUR
To publish this package to the Arch User Repository under your maintainer account:

```bash
# 1. Add AUR remote
git remote add aur ssh://aur@aur.archlinux.org/open-design-desktop.git

# 2. Verify files to commit (do NOT commit .tar.gz or src/pkg)
git status

# 3. Commit and push on master branch
git add PKGBUILD .SRCINFO open-design-desktop.sh open-design-desktop.desktop README.md .gitignore
git commit -m "Initial import: open-design-desktop 0.21.1"
git push --set-upstream aur master
```
