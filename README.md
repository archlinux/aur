# kagi-cli AUR Package

AUR package for [kagi-cli](https://github.com/Microck/kagi-cli).

## Updating

1. Update `pkgver` in both `PKGBUILD` and `.SRCINFO`
2. Get new source tarball SHA256:
   ```bash
   curl -sL "https://github.com/Microck/kagi-cli/archive/refs/tags/v<VERSION>.tar.gz" | sha256sum
   ```
3. Update `sha256sums` in both files
4. Increment `pkgrel` if re-packaging same version
5. Test build locally:
   ```bash
   makepkg -si
   ```
6. Commit and push to AUR