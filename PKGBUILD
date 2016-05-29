# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.33
pkgrel=1
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('04a41dd5177cefe51662b16a4141546e3cfd7737225bf12cf31934cd1fd973bf')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass"
}
