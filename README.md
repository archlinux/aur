# pkgbuilds

distro package builds

## new version checklist

### `PKGBUILD`

    * update `pkgver`
    * download `source`
    * update `md5sum`
    * [optional]: update `depends`

### `.SRCINFO`

   * update `pkgver`
   
```
makepkg --printsrcinfo > .SRCINFO
```