# Maintainer: scan
pkgname=keepass-es
pkgver=2.36
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('419eefe42bd77d63371c08e24ee1e8fe823ea055f46cde46e6ef4025f1a707ad')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass
}
