# kubelogin-bin

AUR package for [kubelogin](https://github.com/int128/kubelogin) — a kubectl plugin for Kubernetes OpenID Connect authentication (`oidc-login`).

## Maintainer workflow

Local development happens on the `main` branch, but the AUR expects `master`. Publish with:

```sh
git push origin main:master
```

### Common tasks

```sh
task build       # makepkg -s
task install     # sudo pacman -U *.pkg.tar.zst
task updpkgsums  # refresh checksums in PKGBUILD
task srcinfo     # regenerate .SRCINFO
task clean       # remove build artifacts
```

Requires [`go-task`](https://taskfile.dev) (`pacman -S go-task`).

### Bumping the version

1. Update `pkgver` in `PKGBUILD` (reset `pkgrel=1`).
2. `task updpkgsums` to refresh `sha256sums_*`.
3. `task srcinfo` to regenerate `.SRCINFO`.
4. Commit both files.
5. `git push origin main:master`.
