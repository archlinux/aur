# nirimon-bin AUR Package

This is the AUR packaging repo for [`nirimon-bin`](https://aur.archlinux.org/packages/nirimon-bin).

Source code lives at: https://github.com/rickycbanks/nirimon

## Installing

```bash
yay -S nirimon-bin
# or
paru -S nirimon-bin
```

## Updating for a new release

1. Update `pkgver` in `PKGBUILD`
2. Regenerate checksums:
   ```bash
   updpkgsums
   ```
3. Regenerate `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```
4. Commit and push:
   ```bash
   git commit -am "v<new_version>"
   git push
   ```
