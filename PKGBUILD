# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=kmonad-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="An advanced keyboard manager - static binary version"
arch=('x86_64')
url="https://github.com/david-janssen/kmonad"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/david-janssen/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-$pkgver-linux"
	"https://github.com/david-janssen/${pkgname%-bin}/archive/$pkgver.tar.gz")
md5sums=('SKIP'
	 'SKIP')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname%-bin}-$pkgver-linux" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "${pkgname%-bin}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
