# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=lux
pkgver=1.2
pkgrel=1
pkgdesc='POSIX Shell script to easily control brightness on backlight controllers.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/lux/archive/v${pkgver}.tar.gz")
sha256sums=('d9f52ad31aa90bf94b120c62d06fbcfe68070b4869b59745095f663d09ad1395')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
