# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=keepass-pt
pkgver=2.46
pkgrel=1
pkgdesc="Portuguese (PT) locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_PT.zip)
arch=(any)
sha256sums=('92ac43b96ca0a1c8a254fa60e4740ca2841493a69016ba0b6b74b10fef30159f')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Portuguese_PT.lngx "${pkgdir}"/usr/share/keepass
}
