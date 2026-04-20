1. Update `pkgver` in `PKGBUILD` file

2. Update `sha256sums` in `PKGBUILD` file

```bash
updpkgsums
```

3. Update `.SRCINFO` file

```bash
makepkg --printsrcinfo > .SRCINFO
```
