# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.31
pkgrel=1
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('fd60fa999ff9204467fe64e01110c7ef196b9f3979501fe5109f91c0d951b47c')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass"
}
