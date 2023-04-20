# Maintainer: ThePirate42 <aur@thepirate42.org>

pkgname=keepass-it
pkgver=2.53
pkgrel=1
pkgdesc="Italian locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Italian.zip")
sha256sums=('7ac9c5bf71dd7a08cf979ba1e44a36ccf8454fc3c74b8c58839593139925e2fd')

package(){
	
	install -d -m755 "$pkgdir/usr/share/keepass/Languages"
	install -m644 Italian.lngx "$pkgdir/usr/share/keepass/Languages/Italian.lngx"
	
}
