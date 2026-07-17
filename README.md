# kappastream-git — AUR submission staging

The committed snapshot of the `kappastream-git` AUR package (the build-from-source
variant). This package is **published** at
https://aur.archlinux.org/packages/kappastream-git — these staged files are the
source of truth for the next update push.

Contents:
- `PKGBUILD` — snapshot of `../../PKGBUILD` (the source of truth for `-git`).
  If that file changes, re-copy it here.
- `.SRCINFO` — **regenerate before pushing** (see below).

This is a VCS package: `source=()` is `git+https://github.com/kappy7777/kappastream`,
`sha256sums=('SKIP')` (integrity comes from the git transport), and `pkgver()`
derives the version from `git describe` at build time, so the committed `pkgver`
here is only a snapshot.

## Before pushing to the AUR

1. **Regenerate `.SRCINFO`** (re-run makepkg on an Arch host to be safe):
   ```
   makepkg --printsrcinfo > .SRCINFO
   ```

## Update

```
git clone ssh://aur@aur.archlinux.org/kappastream-git.git
cd kappastream-git
cp /path/to/here/{PKGBUILD,.SRCINFO,.gitignore,README.md} .
git add PKGBUILD .SRCINFO .gitignore README.md
git commit -m "Update to <version>"
git push
```

The package already exists on the AUR; pushes update it in place.

## Notes / things to consider

- **`gst-libav` is in `depends=`** for parity with `kappastream-bin` and the
  deb/rpm bundles: `avdec_h264` (Twitch is H.264) isn't pulled in by
  `webkit2gtk-4.1`, so without `gst-libav` streams play audio + black video.
- The `pkgver()` `git describe` form requires at least one release tag to be
  reachable from `HEAD` (run `git tag` in the source repo to see the current
  set; any `v<version>` tag will do).
