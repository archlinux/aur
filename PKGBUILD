# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=ledger-udev
pkgver=1
pkgrel=7
pkgdesc='Udev rules to connect a ledger wallet to your linux box'
arch=(any)
url='https://www.ledgerwallet.com'
license=(GPL)
depends=(udev)
install='ledger-udev.install'

source=(https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/20-hw1.rules)
sha256sums=('e6d262beeb5ce40804ad90ce99716617e3fe046afa85a7b8c24e83362b653221')

package() {
  install -Dm 644 20-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/20-hw1.rules
}
