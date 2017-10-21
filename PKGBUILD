# Maintainer: Archadept
#   Revision: 2017-10-21

pkgname=keepass-pl
pkgver=2.37
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('59a75f4c462b9583d60512c8b0973ac2')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass
}


