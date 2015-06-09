# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-ygo
pkgver=2.0.0
pkgrel=7
pkgdesc="YugiOh template for Magic Set Editor."
arch=(any)
url="http://magicseteditor.sourceforge.net"
license=('freeware')
depends=('magicseteditor')
conflicts=('mse-ygo-xyz')
provides=('mse-ygo-xyz')
source=('http://downloads.sourceforge.net/msetemps/Yu-Gi-Oh%20-%20Printed.mse-installer')
md5sums=('47c1cd2065897d465789844828776f33')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./yugioh* "$pkgdir/usr/share/magicseteditor/data"
}

# vim:set ts=2 sw=2 et:
