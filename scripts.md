# To generate .SRCINFO

```bash
makepkg --printsrcinfo > .SRCINFO
```

# To make git version

```bash
git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
```

# To make the package

```bash
pkgbuild
```
