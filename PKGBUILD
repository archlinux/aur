# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=starport
pkgname=${_pkgname}-bin
pkgver=0.18.4
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
	'9f82d3ff41318dbf05485e5abceea621b6909373fbb09e2079b5ec943821252f'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
