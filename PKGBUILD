# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Michael Bentlage <m.bentlage {at} gmail {dot} com>
pkgname=keepass-de
pkgver=2.47
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
sha1sums=('b482d905c4402a607629e8535be4692c8c062378')
md5sums=('35469ce41aafbe64baffeec3b4a32761')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
