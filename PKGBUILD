# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=gaia
pkgname=${_pkgname}d-bin
pkgver=5.0.8
pkgrel=1
pkgdesc="Cosmos SDK application for the Cosmos Hub"
arch=('x86_64')
url="https://github.com/cosmos/${_pkgname}"
license=('Apache')
provides=("${_pkgname}d")
source=(
	"https://github.com/cosmos/${_pkgname}/releases/download/v${pkgver}/${_pkgname}d-v${pkgver}-linux-amd64"
	"https://raw.githubusercontent.com/cosmos/${_pkgname}/v${pkgver}/LICENSE"
)
sha256sums=(
	'846eaa6d213f99021cdcd21fb05db20137a13dc604e5f87d858c15ea4d9b503c'
	'98bf5ef31e3c439d9d721a2b919fa285ad6a1ee607d71fb062a8b1849ae1e1fc'
)

package() {
	install -D "${_pkgname}d-v${pkgver}-linux-amd64" "$pkgdir/usr/bin/${_pkgname}d"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
