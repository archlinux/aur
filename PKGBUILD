# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-cursor-theme-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Material Based Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/Bibata_Cursor"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/Bibata.tar.gz")
sha256sums=('6163ad56de626e4224792c129060aa36b753b4309ae8e08df643581cd3953338')

package() {
	install -d "$pkgdir/usr/share/icons"
	cp -r Bibata*  "$pkgdir/usr/share/icons"
	chmod -R 755 "$pkgdir"/usr/share/icons/Bibata-*
}
