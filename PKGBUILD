# Maintainer: ThePuzzlemaker <tpzker@thepuzzlemaker.info>

pkgname=lux
pkgver=1.21
pkgrel=1
pkgdesc='POSIX Shell script to easily control brightness on backlight controllers.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/lux/archive/v${pkgver}.tar.gz")
sha256sums=('73fe3cb3b3e54b36812e1fb0da1b0f9c9b67a8339ef1468acf335b8fa0e52402')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
