# notepad-plus-plus-linux-bin (AUR)

This folder contains the AUR packaging files for the prebuilt binary package:

- package name: `notepad-plus-plus-linux-bin`
- release source: GitHub Releases tarball (`notepad-plus-plus-linux-v<version>-x86_64.tar.xz`)

## Local verification

```bash
cd packaging/aur/notepad-plus-plus-linux-bin
makepkg -si
```

## Version bump checklist

1. Update `pkgver` in `PKGBUILD`.
2. Update the release tarball checksum in `sha256sums`.
3. Regenerate `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```
4. Test with `makepkg -si`.
