# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=ledger-udev
pkgver=1
pkgrel=3
pkgdesc='Udev rules to connect a ledger wallet to your linux box'
arch=(any)
url='https://www.ledgerwallet.com'
license=(GPL)
depends=(udev)
install='ledger-udev.install'

source=(20-hw1.rules)
sha256sums=('b0dd5cca8d55bfae10ea7d32be2b8eb7016d3f665b0b0ecd4c919be2ad7b0f6e')

package() {
  install -Dm 644 20-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/20-hw1.rules
}
