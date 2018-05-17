# Maintainer: Archadept
#   Revision: 2018-05-17

pkgname=keepass-pl
pkgver=2.39
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('f16387f7251ff5752dee209296fe2743')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass
}


