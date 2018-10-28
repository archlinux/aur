# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.40
pkgrel=1
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('c8ef4e0a369f73e9f990d63bb3743601d3a06578bec3c35c234629f78d8e9b03')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass/Languages"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass/Languages"
}
