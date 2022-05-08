# Maintainer: w0rty <mawo97 at gmail.com>
pkgname=keepass-de
pkgver=2.51
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
md5sums=('dc923218c97e96ef50e5d44827d8875d')
sha1sums=('871f881cdd96bbfd16d4ee4a7dea7b68e0981657')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
