# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.49
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
#makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip)
arch=(any)
md5sums=('978a6b7ce9ae296bb09324d59c46138c')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass/Languages
}
