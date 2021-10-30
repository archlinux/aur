# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=starport
pkgname=${_pkgname}-bin
pkgver=0.18.3
pkgrel=1
pkgdesc="Starport is the all-in-one platform to build, launch and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64')
url="https://cosmos.network/${_pkgname}"
license=('Apache')
provides=("${_pkgname}")
source=(
	"https://github.com/tendermint/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=(
	'4ef21f80b8af077536954b55b4a08215363820ebbf2afa08b1341abb6841102a'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
