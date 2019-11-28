# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.43
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
#makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French-c.zip)
arch=(any)
md5sums=('70cac85929a80517915178f61ef4fde1')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass/Languages
}

