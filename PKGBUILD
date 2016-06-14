# Maintainer: scan
pkgname=keepass-es
pkgver=2.34
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('33728d72db6378edc629a75805976ae6f2a9d5b48f5a7f5c17a46b5bb36abed8')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass
}
