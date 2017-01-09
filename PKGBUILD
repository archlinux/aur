# Maintainer: scan
pkgname=keepass-es
pkgver=2.35
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('3a67efcfdeb8297573ec35e68ac8ab129feab937e7907393625ef4a65f1a46df')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass
}
