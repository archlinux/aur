# Maintainer: scan
pkgname=keepass-es
pkgver=2.38
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('212de104838e4bcb6f41f0fe2fbdd79b7221b33974b94e5590d070203e908cd4')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass
}
