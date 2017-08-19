# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.36
pkgrel=1
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('e53ce90cee812e2e6620e139d24352da3c645d8dd3e5583cc7cc4164fa347336')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass"
}
