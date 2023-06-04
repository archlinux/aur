# Maintainer: ThePirate42 <aur@thepirate42.org>

pkgname=keepass-it
pkgver=2.54
pkgrel=1
pkgdesc="Italian locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Italian.zip")
sha256sums=('425d592ff9f475eb22bac75ce9c72ec642536d504b3ab543d784b6056dddbe7f')

package(){
	
	install -d -m755 "$pkgdir/usr/share/keepass/Languages"
	install -m644 Italian.lngx "$pkgdir/usr/share/keepass/Languages/Italian.lngx"
	
}
