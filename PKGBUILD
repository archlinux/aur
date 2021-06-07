# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-ygo
pkgver=2.0.0
pkgrel=8
pkgdesc="YugiOh template for Magic Set Editor."
arch=(any)
url="http://magicseteditor.sourceforge.net"
license=('freeware')
depends=('magicseteditor')
conflicts=('mse-ygo-xyz')
provides=('mse-ygo-xyz')
source=('https://downloads.sourceforge.net/msetemps/Yu-Gi-Oh%20-%20Printed.mse-installer')
sha256sums=('cb2953c6ee9fef765b7eda25fb691bcd827aaab7009b2ebfb800060889d88636')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./yugioh* "$pkgdir/usr/share/magicseteditor/data"
}

# vim:set ts=2 sw=2 et:
