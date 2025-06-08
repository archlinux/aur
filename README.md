# Recoder AUR Package

This is the Arch User Repository (AUR) package for [Recoder](https://github.com/jeena/recoder) — a GTK4 video transcoding GUI application.

## Installation

You can install this package using an AUR helper like `yay`:

```bash
yay -S recoder
```

Or manually:

```bash
git clone ssh://aur@aur.archlinux.org/recoder.git
cd recoder
makepkg -si
```

## Maintainer Notes: Upgrading to a New Version

When a new version of Recoder is released on GitHub, follow these steps to update this AUR package:

1. **Update the version**
   - Edit `PKGBUILD` and change `pkgver=` to the new version (e.g., `1.1.0`).
   - Update the GitHub release tag in the `source=()` URL if applicable.

2. **Update checksums**
   - Run the following to automatically update the `sha256sums` array:
     ```bash
     updpkgsums
     ```

3. **Regenerate `.SRCINFO`**
   - Required by the AUR:
     ```bash
     makepkg --printsrcinfo > .SRCINFO
     ```

4. **Commit and push**
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to version 1.1.0"
   git push
   ```

## Notes

- Build artifacts like `/src/` and `/pkg/` are ignored via `.gitignore`.
- This repo is for packaging only. For development, see the main [Recoder GitHub repo](https://github.com/jeena/recoder).
