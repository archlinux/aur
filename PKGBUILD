# Maintainer: Archadept
#   Revision: 2018-09-22

pkgname=keepass-pl
pkgver=2.40
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('8e8dcfa3d9f692e399e29b4b7d2bf633')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass/Languages
}


