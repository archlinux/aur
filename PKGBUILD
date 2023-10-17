# Maintainer: Jeff Fredrickson <jeff.fredrickson@gmail.com>
pkgname='disable-c6-systemd'
pkgdesc='A systemd service to disable the C6 state for Ryzen CPUs'
pkgver=1.0.2
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/jfredrickson/disable-c6'
depends=('zenstates-git')
source=('disable-c6.service')
md5sums=('28ecaa89e610d6850b87521e5347fae5')
install=${pkgname}.install

package() {
  install -Dm644 "${srcdir}/disable-c6.service" "${pkgdir}/usr/lib/systemd/system/disable-c6.service"
}
