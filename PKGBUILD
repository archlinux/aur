# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Michael Bentlage <m.bentlage {at} gmail {dot} com>
pkgname=keepass-de
pkgver=2.50
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
sha1sums=('221fc6e885b4201116a5c2adf53845e6952e592b')
md5sums=('6863d1eb4c43761d4ba1ec53a3b6ebd0')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
