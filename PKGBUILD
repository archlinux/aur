# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.39
pkgrel=2
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('1158fa37a4e5161deed981e943b34ae6ea63eba5cd73569ec457c4a782e80b2d')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass/Languages"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass/Languages"
}
