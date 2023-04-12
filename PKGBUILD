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
md5sums=('c2c34c4cc495436bf91d3dfc205afb6d')

package() {
  install -Dm644 "${startdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
