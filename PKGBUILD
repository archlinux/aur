# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-rpc
pkgver=1.1.1
pkgrel=1
pkgdesc="Small RPC server made from endcord parts. Provides Rich Presence and game detection only."
arch=('any')
url="https://github.com/sparklost/$pkgname"
license=('GPL-3.0-only')
provides=('endcord-rpc')
conflicts=('endcord-rpc')
depends=()
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=('SKIP')
options=(!strip)

package() {
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
