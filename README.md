# AUR Packaging

This directory contains files for the AUR package `notification-tray-git`.

## Publishing to AUR

1. Clone the AUR repository:
   ```bash
   git clone ssh://aur@aur.archlinux.org/notification-tray-git.git
   cd notification-tray-git
   ```

2. Copy packaging files:
   ```bash
   cp ../notification-tray/aur/* .
   ```

3. Generate .SRCINFO:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. Commit and push:
   ```bash
   git add PKGBUILD notification-tray.install .SRCINFO
   git commit -m "Update to version X"
   git push
   ```

## Testing locally

From this directory:
```bash
makepkg -si
```
