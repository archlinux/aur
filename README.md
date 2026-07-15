# kappastream-bin — AUR submission staging

The committed snapshot of the `kappastream-bin` AUR package (the prebuilt binary
variant). This package is **published** at
https://aur.archlinux.org/packages/kappastream-bin — these staged files are the
source of truth for the next update push.

Contents:
- `PKGBUILD` — snapshot of `../../PKGBUILD-bin` (the source of truth). If that
  file changes, re-copy it here.
- `.SRCINFO` — **regenerate before pushing** (see below).

## Before pushing to the AUR

1. **Regenerate `.SRCINFO`** (re-run makepkg to be safe):
   ```
   makepkg --printsrcinfo > .SRCINFO
   ```

## Update

```
git clone ssh://aur@aur.archlinux.org/kappastream-bin.git
cd kappastream-bin
cp /path/to/here/{PKGBUILD,.SRCINFO} .
git add PKGBUILD .SRCINFO
git commit -m "Update to 0.1.3"
git push
```

The package already exists on the AUR; pushes update it in place.
