# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=ledger-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect a ledger wallet to your linux box'
arch=(any)
url='https://www.ledgerwallet.com'
license=(GPL)
depends=(udev)
install='ledger-udev.install'

source=(20-hw1.rules)
sha256sums=('575bd46ff8756535643587a3d241f465d734942556eb290044bf4f2f0e67e8f9')

package() {
  install -Dm 644 71-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/20-hw1.rules
}
