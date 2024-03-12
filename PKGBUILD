# Maintainer: ThePirate42 <aur@thepirate42.org>

pkgname=keepass-it
pkgver=2.56
pkgrel=1
pkgdesc="Italian locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL-2.0-or-later')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Italian.zip")
sha256sums=('183dbaa31b220a29716a781c70dc80d26b6dda0e05c466f9052cae0959eba837')

package(){
	
	install -d -m755 "$pkgdir/usr/share/keepass/Languages"
	install -m644 Italian.lngx "$pkgdir/usr/share/keepass/Languages/Italian.lngx"
	
}
