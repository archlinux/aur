# Maintainer: Archadept
#   Revision: 2017-08-19

pkgname=keepass-pl
pkgver=2.36
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('725d1da282f302299f5f44996cd7c7e3')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass
}


