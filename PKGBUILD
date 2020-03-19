# Maintainer: Archadept
#   Revision: 2020-03-20

pkgname=keepass-pl
pkgver=2.44
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('7fc44bfd243ef69099915d2180eec108')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass/Languages
}


