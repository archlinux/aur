# Maintainer: Jeff Fredrickson <jeff.fredrickson@gmail.com>
pkgname='disable-c6-systemd'
pkgdesc='A systemd service to disable the C6 state for Ryzen CPUs'
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/jfredrickson/disable-c6'
depends=('zenstates-git')
source=('disable-c6.service')
md5sums=('1469c232bd5fbe9cbfb62f8a6238c584')
install=${pkgname}.install

package() {
  install -Dm644 "${srcdir}/disable-c6.service" "${pkgdir}/usr/lib/systemd/system/disable-c6.service"
}
