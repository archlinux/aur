# Maintainer: scan
pkgname=keepass-es
pkgver=2.32
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
md5sums=('b69b0c02529b74c9221835ec10a8d782')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass
}
