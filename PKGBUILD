# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=batify
pkgver=0.7
pkgrel=1
pkgdesc='Easy way to set battery level warnings using an udev rule and libnotify.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('')
source=("https://github.com/Ventto/${pkgname}/archive/master.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${pkgname}-master
  make
}

package() {
  cd ${pkgname}-master
  make DESTDIR="${pkgdir}/" install
}
