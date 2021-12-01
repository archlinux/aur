# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=starport
pkgname=${_pkgname}-bin
pkgver=0.18.6
pkgrel=1
pkgdesc="Starport is the all-in-one platform to build, launch and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64')
url="https://${_pkgname}.com"
license=('Apache')
provides=("${_pkgname}")
source=(
	"https://github.com/tendermint/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=(
	'907bd56512b0854c1c99d1e9bd309d163947ae09ab86cfbe9b31b27fb092c8d4'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
