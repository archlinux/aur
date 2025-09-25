# mgmt-bin

## Before pushing

### Regenerate sha256sums

```bash
makepkg --geninteg
# Manually copy the to PKGBUILD
```

### Update .SRCINFO

```bash
makepkg --printsrcinfo > .SRCINFO
```

### Build package locally for testing

```bash
makepkg -sfci
```
