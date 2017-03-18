# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=lux
pkgver=1.1
pkgrel=1
pkgdesc='Shell script to easily control brightness on backlight controllers.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/lux/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
