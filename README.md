# vex-tui-bin

AUR package for [vex-tui](https://github.com/CodeOne45/vex-tui) - a terminal-based Excel and CSV viewer.

## Updating to a new version

1. Edit `PKGBUILD` and set new `pkgver`
2. Run:
   ```bash
   updpkgsums && makepkg --printsrcinfo > .SRCINFO && makepkg -sf
   ```
3. Commit and push:
   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m "Update to vX.X.X"
   git push
   ```
