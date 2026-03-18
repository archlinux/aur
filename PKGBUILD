# Maintainer: scan
pkgname=keepass-es
pkgver=2.61
pkgrel=1
pkgdesc="KeePass Español"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Spanish.zip)
arch=(any)
sha256sums=('387b314238a6a59d86b17874cc9436956fa2e4054715d2df97b68ca7271c2f6c')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 Spanish.lngx "${pkgdir}"/usr/share/keepass/Languages
}
