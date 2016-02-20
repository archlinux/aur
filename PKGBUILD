# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>

pkgname=toggl-cli
_majorver=0.2
pkgver=0.2.1
pkgrel=1
_author=gabalese
_maintainer=alexandre-mbm
pkgdesc="Command line client for Toggl timekeeping"
arch=('any')
url="https://github.com/${_author}/${pkgname}"
license=('MIT')
depends=('java-runtime')
makedepends=()
source=("https://github.com/${_author}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${_majorver}.tar.gz")
md5sums=('8653f9d5728dad2bd6e0e9a3911fb3e8')

package() {
  cd "${srcdir}"
  make PREFIX="${pkgdir}/usr/local" install
}
