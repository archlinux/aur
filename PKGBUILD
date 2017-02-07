# Maintainer: Archadept
#   Revision: 2017-02-07

pkgname=keepass-pl
pkgver=2.35
pkgrel=1
pkgdesc="Polish locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Polish.zip)
arch=(any)
md5sums=('e68dd2df7116b73bf725b46c3a4d92ad')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Polish.lngx "${pkgdir}"/usr/share/keepass
}


