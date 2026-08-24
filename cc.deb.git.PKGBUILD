# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
#
# Cross-compilation of the develop tip (git) for every release arch + Debian
# packaging. = cc.deb.PKGBUILD (one run loops _pkgarches, cross-compiles each
# and hand-rolls one .deb per arch) + the git override (build `...@develop`
# instead of the release tag). One `makepkg -p cc.deb.git.PKGBUILD` emits the
# full set of develop .debs.
source cc.deb.PKGBUILD
pkgdesc="Skywire Mainnet Node implementation. Develop Branch. Debian package; cross-compile."

# Build the develop tip in every per-arch _build: _ref=${_goref:-v${pkgver}}.
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
