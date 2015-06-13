# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.29
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip)
arch=(any)
md5sums=('43204029213dee42d2ef82b2332ac5fe')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass
}

