# Maintainer: beest <gnubeest at zoho dot com>
# Contributor: Alexander F Rødseth <xyproto at archlinux dot org>

pkgname=ski
pkgver=6.12
pkgrel=2
pkgdesc='A hotdogging game, evade the deadly Yeti on your jet-powered skis.'
arch=('any')
depends=('python')
url='http://www.catb.org/esr/ski/'
license=('BSD')
source=("http://www.catb.org/esr/ski/$pkgname-$pkgver.tar.gz")
sha256sums=('2f34f64868deb0cc773528c68d9829119fac359c44a704695214d87773df5a33')

package() {
    cd "$pkgname-$pkgver"

	install -Dm755 ski "$pkgdir/usr/bin/ski"
	install -Dm644 ski.6 "$pkgdir/usr/share/man/man6/ski.6"
	install -Dm644 ski.desktop "$pkgdir/usr/share/applications/ski.desktop"
	install -Dm644 ski.png "$pkgdir/usr/share/pixmaps/ski.png"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
