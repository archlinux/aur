# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=keepass-pt
pkgver=2.34
pkgrel=1
pkgdesc="Portuguese (PT) locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_PT.zip)
arch=(any)
md5sums=('3aacd7f43e44664e4d92f30c9b83ee2c')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Portuguese_PT.lngx "${pkgdir}"/usr/share/keepass
}
