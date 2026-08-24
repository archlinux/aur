# skywire (AUR) — build variants

This package builds the [Skywire](https://github.com/skycoin/skywire) visor
**from source**, statically linked against **musl** (the default everywhere —
the release workflow and every variant here). The AUR-published `PKGBUILD` is
the canonical one; the other `*.PKGBUILD` files are auxiliary build variants
kept in the repo. Each variant just `source`s a simpler one and overrides the
one axis that differs, so behaviour stays in lockstep.

For the **prebuilt** binary (no toolchain, no compile) see the separate
[`skywire-bin`](https://aur.archlinux.org/packages/skywire-bin) package.

## The variant matrix

Three independent axes — **source** (release tag vs develop tip), **target**
(native vs cross-compile), **output** (pacman vs deb) — give 2×2×2 = 8 files.
The filename is the axes that differ from the plain `PKGBUILD`, in the order
`cc.` · `deb.` · `git.`:

| file                    | source           | target                    | output |
| ----------------------- | ---------------- | ------------------------- | ------ |
| `PKGBUILD`              | release tag      | native                    | pacman |
| `git.PKGBUILD`          | develop tip      | native                    | pacman |
| `deb.PKGBUILD`          | release tag      | native                    | deb    |
| `deb.git.PKGBUILD`      | develop tip      | native                    | deb    |
| `cc.PKGBUILD`           | release tag      | cross (per-CARCH)         | pacman |
| `cc.git.PKGBUILD`       | develop tip      | cross (per-CARCH)         | pacman |
| `cc.deb.PKGBUILD`       | release tag      | cross (all arches)        | deb    |
| `cc.deb.git.PKGBUILD`   | develop tip      | cross (all arches)        | deb    |

- **source** — release builds `go install …/cmd/skywire@v${pkgver}`; the `git`
  variants set `_goref=develop` so `_build` fetches the develop tip and derive
  `pkgver` from `go list …@develop`.
- **target** — native uses the host `GOARCH` + `musl-gcc`. `cc.PKGBUILD` /
  `cc.git.PKGBUILD` are **CARCH-driven**: `makepkg` maps its `$CARCH` to the
  matching `GOARCH` + static-musl cross toolchain, one package per run.
  `cc.deb.PKGBUILD` / `cc.deb.git.PKGBUILD` instead loop every release arch in
  a single run and hand-roll one `.deb` each (a `.deb` is arch-tagged, so this
  is the natural way to produce the whole set at once).
- **output** — pacman variants use makepkg's normal packaging; deb variants
  call the shared `_packagedeb` helper (`dpkg-deb`) and `exit` before makepkg
  would build its own package. The postinst/prerm/postrm scripts come from the
  shared `_gen_deb_scripts` in `PKGBUILD`, so pacman `.install` and deb
  maintainer-script behaviour match.

## Building

```
# canonical: native release, pacman
makepkg -si

# develop tip, native, pacman
makepkg -p git.PKGBUILD

# native release, .deb
makepkg -p deb.PKGBUILD

# cross-compile one foreign arch, pacman (loop CARCH for more)
makepkg --config <(cat /etc/makepkg.conf; echo CARCH=aarch64) -p cc.PKGBUILD

# cross-compile every release arch, .deb (one run, all arches)
makepkg -p cc.deb.PKGBUILD
```

Build a fork or branch by exporting `FORK=<github-user>` (or editing the
develop ref in the `git` variants) before `makepkg`.

## Cross toolchains

The `cc.*` variants statically cross-link with musl and need the corresponding
cross toolchains (AUR): `aarch64-linux-musl-cross-bin`,
`muslcc-arm-linux-musleabihf-cross-bin`, `muslcc-arm-linux-musleabi-cross-bin`.
Native builds need only `musl` + `kernel-headers-musl`.

## Other files

`dev.PKGBUILD` and `systray-git.PKGBUILD` are unrelated development/spin
variants, not part of the matrix above.
