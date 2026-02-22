# AUR Packaging

This directory contains files for the AUR package `voidrice-git`.

## Publishing to AUR

1. Clone the AUR repository:
   ```bash
   git clone ssh://aur@aur.archlinux.org/voidrice-git.git
   cd voidrice-git
   ```

2. Copy packaging files:
   ```bash
   cp ../voidrice/aur/* .
   ```

3. Generate .SRCINFO:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. Commit and push:
   ```bash
   git add PKGBUILD voidrice.install .SRCINFO
   git commit -m "Update to version X"
   git push
   ```

## Testing locally

From this directory:
```bash
makepkg -si
```
