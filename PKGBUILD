# Maintainer: w0rty <mawo97 at gmail.com>
pkgname=keepass-de
pkgver=2.52
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
md5sums=('e2802c53ff4cb43bf37c81c2f2b8e280')
sha1sums=('b6f43f18416cfb95a5312437f5638ce2f958096b')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
