# Maintainer: w0rty <mawo97 at gmail.com>
pkgname=keepass-de
pkgver=2.56
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
md5sums=('21a118ba67c67b269c603c6ada207937')
sha1sums=('d16b449c629dcc4fe9c8a7b763285ee27b9648fb')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
