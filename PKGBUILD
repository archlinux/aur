# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.45
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
#makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French-b.zip)
arch=(any)
md5sums=('208196e5ee86f57c9b95df455f12c9a2')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass/Languages
}
