# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

pkgname=calibre-installer
pkgver=0.3
pkgrel=1
pkgdesc="Automatically install and update the calibre standalone binaries"
arch=('any')
url="https://github.com/eli-schwartz/${pkgname}"
license=('GPL')
depends=('wget' 'python')
conflicts=('calibre')
install=${pkgname}.install
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6ed98488393116144867d2ca687b34a6cd741a6f90937def44d40894a716afce')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/linux"
  ./calibre-installer.sh --local --prefix "${pkgdir}"
}
