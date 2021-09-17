# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=starport
pkgver=0.17.3
pkgrel=1
pkgdesc="Starport is the all-in-one platform to build, launch and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64')
url="https://cosmos.network/starport"
license=('Apache')
source=(
	"https://github.com/tendermint/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=(
	'9fc1baa16d68e22d8e426914b22a4fa2a4da18fab3268ec68cefd6d693165638'
)

package() {
	install -Dt "$pkgdir/usr/local/bin" "$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
