# AUR package files

This folder keeps a backup of the files used to publish `bc250-control-center-git` in the Arch User Repository.

AUR package page:

```text
https://aur.archlinux.org/packages/bc250-control-center-git
```

## Files

- `PKGBUILD`: package recipe.
- `.SRCINFO`: metadata generated from `PKGBUILD`.
- `bc250-control-center.install`: small post-install hook for icon cache refresh.

## Update from a new PC

Clone the AUR package repository:

```bash
git clone ssh://aur@aur.archlinux.org/bc250-control-center-git.git
cd bc250-control-center-git
```

Copy the files from this project:

```bash
cp /path/to/bc250-control-center/packaging/arch/aur/PKGBUILD .
cp /path/to/bc250-control-center/packaging/arch/aur/.SRCINFO .
cp /path/to/bc250-control-center/packaging/arch/aur/bc250-control-center.install .
```

Regenerate `.SRCINFO` after editing `PKGBUILD`:

```bash
makepkg --printsrcinfo > .SRCINFO
```

Commit and push to AUR:

```bash
git add PKGBUILD .SRCINFO bc250-control-center.install
git commit -m "Update package"
git push
```

Do not upload built packages to AUR. AUR only needs the package recipe files.
