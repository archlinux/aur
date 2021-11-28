# Maintainer: Ranadeep B < mail at rnbguy dot at >

_reponame=ibc-rs
_pkgname=hermes
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Hermes IBC Relayer"
arch=('x86_64')
url="https://${_pkgname}.informal.systems/"
license=('Apache')
provides=("${_pkgname}")
source=(
    "https://github.com/informalsystems/${_reponame}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz"
    "https://raw.githubusercontent.com/informalsystems/${_reponame}/v${pkgver}/LICENSE"
)
sha256sums=(
	'31785abb8c2ab2bee68ff3003080d049ea9b702a43ce8f8a937bf8df5370c3e6'
	'1816dfba29b8182ddffbc675e228906b2acaa338fcaada5e330065e650092689'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
