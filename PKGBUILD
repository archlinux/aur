# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=evostream-systemd
pkgver=1.1.0
pkgrel=1
pkgdesc="EvoStream Media Server SystemD service"
arch=('any')
license=('MIT')
makedepends=('git')
install="${pkgname}.install"
source=("git+https://github.com/tomi77/ems-systemd.git")
md5sums=('SKIP')

package() {
  depends=("evostreamms")

  msg2 "Installing SystemD service..."
  install -Dm644 "${srcdir}/ems-systemd/evostreamms.service" "${pkgdir}/usr/lib/systemd/system/evostreamms.service"
  install -Dm644 "${srcdir}/ems-systemd/evostreamms-webui.service" "${pkgdir}/usr/lib/systemd/system/evostreamms-webui.service"
  install -Dm644 "${srcdir}/ems-systemd/evostreamms-webservices.service" "${pkgdir}/usr/lib/systemd/system/evostreamms-webservices.service"
}
