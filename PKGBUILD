# Maintainer: pbnoxious <pbnoxious at web dot de>
# Contributor: beest <gnubeest at zoho dot com>
# Contributor: Alexander F Rødseth <xyproto at archlinux dot org>

pkgname=ski
pkgver=6.13
pkgrel=1
pkgdesc='A hotdogging game, evade the deadly Yeti on your jet-powered skis.'
arch=('any')
depends=('python')
url='http://www.catb.org/esr/ski/'
license=('BSD')
source=("http://www.catb.org/esr/ski/$pkgname-$pkgver.tar.gz")
sha256sums=('34e95547ecfe7b3791df0a81fef9af422ececf49b1aa1e93bbb1ba067ccdc955')

package() {
    cd "$pkgname-$pkgver"

	install -Dm755 ski "$pkgdir/usr/bin/ski"
	install -Dm644 ski.6 "$pkgdir/usr/share/man/man6/ski.6"
	install -Dm644 ski.desktop "$pkgdir/usr/share/applications/ski.desktop"
	install -Dm644 ski.png "$pkgdir/usr/share/pixmaps/ski.png"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
