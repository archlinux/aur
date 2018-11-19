# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=ledger-udev
pkgver=1
pkgrel=2
pkgdesc='Udev rules to connect a ledger wallet to your linux box'
arch=(any)
url='https://www.ledgerwallet.com'
license=(GPL)
depends=(udev)
install='ledger-udev.install'

source=(20-hw1.rules)
sha256sums=('4acca406fb7f2f53817399b78b347695fdc5bd08c1bb1cb8406b6a7328d2f475')

package() {
  install -Dm 644 20-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/20-hw1.rules
}
