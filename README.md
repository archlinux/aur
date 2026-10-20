# hmcl-no-download-restriction

AUR package based on [hmcl](https://aur.archlinux.org/packages/hmcl), built from
upstream HMCL with the mainland China download restriction removed.

## How it works

Upstream commit
[`583e004`](https://github.com/HMCL-dev/HMCL/commit/583e004d718102ae4489aa3f64bcde0c0161d000)
("在中国大陆地区禁用游戏下载功能", #7017) introduced region checks that disable game
downloads for mainland Chinese machines/networks. The package pins the source tarball to
that exact commit and applies `revert-583e004.patch` in `prepare()` before building.

After the patch is applied, the resulting source tree is identical to commit
`abd0db1a2fa469748802dd127198dbb419061c09`, the revert commit in this repository.

## Version

`pkgver=3.17.0.361.r1.g583e004d7` means: one commit after upstream tag `v3.17.0.361`,
at commit `583e004d7`. The commit is newer than the latest tag, so a fixed commit hash is
used instead of a release tarball.

## Build

```bash
cd aur/hmcl-no-download-restriction
makepkg -si
```

Build requirements are the same as the upstream `hmcl` package: JDK 17 and network access
for Gradle dependencies. The package installs:

- `/usr/bin/hmcl-no-download-restriction`
- `/usr/share/java/hmcl-no-download-restriction/hmcl-no-download-restriction.jar`
- a desktop entry and hicolor icons

The launcher stores its configuration in
`${XDG_CONFIG_HOME:-$HOME/.config}/hmcl-no-download-restriction`, separate from the
regular `hmcl` package.

## Microsoft login credentials

Like the AUR `hmcl` package, this package exports pre-configured Microsoft OAuth
credentials during the build. They come from the `hmcl` package maintainer
(Misaka13514) and may be changed or revoked at any time. Register your own Azure
application and pass `-Dhmcl.microsoft.auth.id=... -Dhmcl.microsoft.auth.secret=...`
if you need long-term reliability.

## Regenerating the patch

From the repository root:

```bash
git diff 583e004d718102ae4489aa3f64bcde0c0161d000 \
         abd0db1a2fa469748802dd127198dbb419061c09 \
  > aur/hmcl-no-download-restriction/revert-583e004.patch
```

Then refresh `b2sums` in `PKGBUILD` and run `makepkg --printsrcinfo > .SRCINFO`.
