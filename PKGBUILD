# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=evostream-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="EvoStream Media Server SystemD service"
arch=('any')
license=('MIT')
makedepends=('git')
source=("git+https://github.com/tomi77/ems-systemd.git")
md5sums=('SKIP')

package() {
  msg2 "Installing SystemD service..."
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mv -f "${srcdir}/ems-systemd/evostreamms.service" "${pkgdir}/usr/lib/systemd/system/evostreamms.service"
}
