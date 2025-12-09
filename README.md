# Void Editor (AUR Package)

Arch Linux AUR package for Void Editor.
AUR URL: https://aur.archlinux.org/packages/void-editor-bin

## Installation
```bash
yay -S void-editor-bin
```

## Maintenance (For PeteHsu)
1. Update `pkgver` in PKGBUILD.
2. Run `updpkgsums`.
3. Run `makepkg --printsrcinfo > .SRCINFO`.
4. Commit and push:
   ```bash
   git commit -am "Update version"
   git push origin master  # To AUR
   git push github master  # To GitHub
   ```
