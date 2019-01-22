# Maintainer: Archadept
#   Revision: 2019-01-22

pkgname=keepass-pl
pkgver=2.41
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('2ceed38a5aea4dc19185c6df7407695d')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass/Languages
}


