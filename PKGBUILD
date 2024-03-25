# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=ledger-udev
pkgver=1
pkgrel=9
pkgdesc='Udev rules to connect a ledger wallet to your linux box'
arch=(any)
url='https://www.ledgerwallet.com'
license=(Apache)
depends=(udev)
install='ledger-udev.install'

source=(https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/20-hw1.rules)
sha256sums=('0a67fa9b7024048f7f967fef8d33c2da38dae9354e996c131b79a014f62b7efc')

package() {
  install -Dm 644 20-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/20-hw1.rules
}
