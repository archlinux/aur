# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.40
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip)
arch=(any)
md5sums=('f36d01574d8ece8e9eb0f7f33632019a')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass/Languages
}

