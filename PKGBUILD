# Maintainer: scan
pkgname=keepass-es
pkgver=2.53
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('b61e644a810ece0b8ca905b1a3b95717a752ec381d70f4a1e6a12ef4492d4f86')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass/Languages
}
