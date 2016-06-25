# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.34
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip)
arch=(any)
md5sums=('43c08184192669bd80c1c998cbf5ba84')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass
}

