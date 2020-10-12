# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
depends=('libxcursor' 'libpng')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('e46755e059d2166840e2113009201d2f318197e7cc16582a98aaa1766102332d')

package() {
	install -d "$pkgdir/usr/share/icons"
	cp -r Bibata*  "$pkgdir/usr/share/icons"
	chmod -R 755 "$pkgdir"/usr/share/icons/Bibata-*
}
