# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Based on https://aur.archlinux.org/packages/ledger-udev by Josh Ellithorpe

pkgname=keepkey-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect a keepkey hardware wallet to your linux box'
arch=(any)
url='https://shapeshift.io/keepkey/'
license=(GPL)
depends=(udev)
install='keepkey-udev.install'

source=(https://raw.githubusercontent.com/keepkey/udev-rules/master/51-usb-keepkey.rules)
sha256sums=('37d466ed3f86d44c2512a7d67c457e3c9fde26252f06765aff2948a121d29448')

package() {
  install -Dm 644 51-usb-keepkey.rules "$pkgdir"/usr/lib/udev/rules.d/51-usb-keepkey.rules
}
