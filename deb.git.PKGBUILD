# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
#
# Native compilation of the develop tip (git) + Debian packaging.
# = deb.PKGBUILD (deb packaging, native arch) + git.PKGBUILD (build the
#   develop tip via `go install ...@develop` instead of the release tag).
source deb.PKGBUILD
pkgdesc="Skywire Mainnet Node implementation. Develop Branch. Debian package"

# Build the develop tip, not the release tag. `_build` reads `_goref`
# (_ref=${_goref:-v${pkgver}}); setting it here makes every _build in the
# inherited deb package() fetch develop.
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
