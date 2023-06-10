# Maintainer: w0rty <mawo97 at gmail.com>
pkgname=keepass-de
pkgver=2.54
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
md5sums=('638eeddd6c49a6be4a613d1a09de58f6')
sha1sums=('f391cdd16339bfcf609a38f210947b696dc69c1e')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
