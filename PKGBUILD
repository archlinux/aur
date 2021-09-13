# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Michael Bentlage <m.bentlage {at} gmail {dot} com>
pkgname=keepass-de
pkgver=2.49
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
sha1sums=('a24298413bd139aba75d261aedf1710e27c7ed3b')
md5sums=('3e19318c846063dd7023ed50acd1694d')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
