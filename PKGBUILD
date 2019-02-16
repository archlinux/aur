# Maintainer: Jeff Fredrickson <jeff.fredrickson@gmail.com>
pkgname='disable-c6-systemd'
pkgdesc='A systemd service to disable the C6 state for Ryzen CPUs'
pkgver=1.0.1
pkgrel=2
arch=('any')
license=('MIT')
url='https://github.com/jfredrickson/disable-c6'
depends=('zenstates-git')
source=('disable-c6.service')
md5sums=('d75b5b334bf8acb0e710874f918b5df6')
install=${pkgname}.install

package() {
  install -Dm644 "${srcdir}/disable-c6.service" "${pkgdir}/usr/lib/systemd/system/disable-c6.service"
}
