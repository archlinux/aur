# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mazter-bin
pkgver=0.4.0
pkgrel=2
pkgdesc='Mazes in your terminal'
arch=('x86_64')
url='https://github.com/canop/mazter'
license=('MIT')
depends=('gcc-libs')
provides=('mazter')
conflicts=('mazter')
source_x86_64=("$pkgname-$pkgver.zip::https://dystroy.org/mazter/download/mazter_$pkgver.zip")
sha256sums_x86_64=('987c45d9694c0c47e57bfc710182eedf441ad0e4e79ad384cf31673ca5908b7f')

package() {
	cd build
	install -D "$CARCH-linux/mazter" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
