# Maintainer: Archadept
#   Revision: 2018-02-07

pkgname=keepass-pl
pkgver=2.38
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('7145b25640bfcbdf2d9ea0836020ab41')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass
}


