# openpilot-cabana AUR Package

## Files

- `PKGBUILD` - Arch Linux package build script
- `archlinux.patch` - Patches for Arch Linux compatibility (Qt6, compiler warnings)
- `cabana.desktop` - Desktop entry
- `.github/workflows/ci.yml` - GitHub Actions for CI/CD
- `.gitignore` - Build artifacts

## Building

```bash
makepkg -s
```

## Publishing to AUR

1. Create AUR account and add SSH key
2. Clone: `git clone aur@aur.archlinux.org:openpilot-cabana.git`
3. Copy files: `cp PKGBUILD archlinux.patch cabana.desktop openpilot-cabana/`
4. Commit and push: `git add . && git commit -m "Initial" && git push`

## Auto-Update on Release

The CI workflow automatically publishes to AUR when a GitHub release is created.

1. Create a release on GitHub with tag `v*` (e.g., `v1.1.2`)
2. CI builds and tests
3. CI pushes updated PKGBUILD to AUR

## Manual Update

```bash
# Update pkgver and rebuild
makepkg -s
makepkg --printsrcinfo > .SRCINFO  # Generate .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Update to X.Y.Z"
git push
```

## Patches Included

`archlinux.patch` includes:
- Qt6 detection via cmake/pkg-config (qmake6 on Arch points to Qt5)
- Fallback Qt6 tool paths for Arch Linux
- Compiler warning suppressions for deprecated declarations