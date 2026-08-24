# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
#
# Cross-compilation of the develop tip (git), packaged for pacman — CARCH-driven.
# = cc.PKGBUILD (CARCH -> GOARCH/musl cross build + pacman package) + the git
#   override (build `...@develop` instead of the release tag). One makepkg run
#   per arch:
#
#     makepkg --config <(cat /etc/makepkg.conf; echo CARCH=aarch64) -p cc.git.PKGBUILD
source cc.PKGBUILD
pkgdesc="Software defined networking with public keys. Skycoin.com. Develop Branch; cross-compile (per-CARCH)."

# Build the develop tip: _build reads _goref (_ref=${_goref:-v${pkgver}}).
_goref=develop
source=("${_source[@]}")
sha256sums=('SKIP')

pkgver() {
_version=$(go list -mod=mod -m github.com/skycoin/skywire@develop | cut -d' ' -f2)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}
