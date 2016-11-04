# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.34
pkgrel=1
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('66edc921389daac9bd40b5d4031bb281db062dadf78e1f15d0754937e4196f96')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass"
}
