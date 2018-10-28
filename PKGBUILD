# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=keepass-pt
pkgver=2.40
pkgrel=1
pkgdesc="Portuguese (PT) locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Portuguese_PT.zip)
arch=(any)
sha256sums=('62c759c11782b2548ef7dceedbe76b2c978cab764ff6b19ed76898ab172f721a')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Portuguese_PT.lngx "${pkgdir}"/usr/share/keepass
}
