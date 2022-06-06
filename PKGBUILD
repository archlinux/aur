# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=keepass-pt
pkgver=2.51
pkgrel=1
pkgdesc="Portuguese (PT) locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_PT.zip)
arch=(any)
sha256sums=('f72c74b703f6b496db5684412542c9813b8c5389aae6131da248b4edb37fcbfa')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Portuguese_PT.lngx "${pkgdir}"/usr/share/keepass
}
