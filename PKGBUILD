# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=keepass-de
pkgver=2.30
pkgrel=1
pkgdesc="German locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip)
arch=(any)
sha256sums=('bf441ec3d73e0d65dc44a4a9f5b7ae9752a917b87c84490973c9953062774185')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 German.lngx "${pkgdir}/usr/share/keepass"
}
