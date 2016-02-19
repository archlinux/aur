# Maintainer: scan
pkgname=keepass-es
pkgver=2.31
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
md5sums=('6fa05fc799bdf2b371ed6c15ceb9145c')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass
}
