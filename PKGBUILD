# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=conservation_mode
pkgver=0.1
pkgrel=1
pkgdesc="enable conservation_mode for lenovo laptop"
arch=('i686' 'x86_64')
license=('GPL3')
depends=(systemd)
makedepends=()
conflicts=()
provides=()
source=("conservation_mode.service")
md5sums=('1f0b278b3e3097509340b2d383fee347')

package() {
  install -Dm644 "${startdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
