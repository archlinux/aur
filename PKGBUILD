# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=gaia
pkgname=${_pkgname}d-bin
pkgver=5.0.6
pkgrel=1
pkgdesc="Cosmos SDK application for the Cosmos Hub"
arch=('x86_64')
url="https://github.com/cosmos/${_pkgname}"
license=('Apache')
provides=("${_pkgname}d")
source=(
	"${_pkgname}d::https://github.com/cosmos/${_pkgname}/releases/download/v${pkgver}/${_pkgname}d-v${pkgver}-linux-amd64"
	"https://raw.githubusercontent.com/cosmos/${_pkgname}/v${pkgver}/LICENSE"
)
sha256sums=(
	"402e05d8e6260f9b19266187db58912c26ab0ee33bafee656c06fe2ae332bbb2"
	"98bf5ef31e3c439d9d721a2b919fa285ad6a1ee607d71fb062a8b1849ae1e1fc"
)

package() {
	install -Dt "$pkgdir/usr/bin" "${_pkgname}d"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
