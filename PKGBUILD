# Maintainer: scan
pkgname=keepass-es
pkgver=2.45
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('a16c1c0bc130c3a687fd3159c6f8c1a8b21535bf4e7df67b8821ca17b1d70e8e')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass/Languages
}
