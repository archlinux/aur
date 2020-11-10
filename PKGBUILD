# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
depends=('libxcursor' 'libpng')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('0b04ffce053c48cd01c3f9a0ba9d6292dff7d82ba509d87c236dbcbbe991dccf')

package() {
	install -d "$pkgdir/usr/share/icons"
	cp -r Bibata*  "$pkgdir/usr/share/icons"
	chmod -R 755 "$pkgdir"/usr/share/icons/Bibata-*
}
