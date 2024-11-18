# Maintainer: ThePirate42 <aur@thepirate42.org>

pkgname=keepass-it
pkgver=2.57.1
pkgrel=1
pkgdesc="Italian locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL-2.0-or-later')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Italian.zip")
sha256sums=('533de6aec9e11f872a9908e8579161970dd93d5f9fedd9a2f3cb49fbbbfbb682')

package(){
	
	install -d -m755 "$pkgdir/usr/share/keepass/Languages"
	install -m644 Italian.lngx "$pkgdir/usr/share/keepass/Languages/Italian.lngx"
	
}
