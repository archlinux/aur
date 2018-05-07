# Maintainer: scan
pkgname=keepass-es
pkgver=2.39
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('248f51e2b3bdedb17254d918c04105494c6152656e60bbc7ce000cc0edd2f928')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass/Languages
}
