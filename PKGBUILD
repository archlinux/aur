# Maintainer: scan
pkgname=keepass-es
pkgver=2.56
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('8fe5870963341919d32d357c3026d53a62526d492df8f474e5188fc74e958f37')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass/Languages
}
