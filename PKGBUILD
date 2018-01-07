# $Id: PKGBUILD 257018 2017-09-11 20:07:26Z jelle $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=btchip-udev
pkgver=2
pkgrel=2
pkgdesc='Udev rules to connect BTChip wallet to your linux box'
arch=(any)
url='https://hardwarewallet.com/'
license=(GPL)
depends=(udev)
install='btchip-udev.install'

source=(71-hw1.rules)
sha256sums=('4acca406fb7f2f53817399b78b347695fdc5bd08c1bb1cb8406b6a7328d2f475')

package() {
  install -Dm 644 71-hw1.rules "$pkgdir"/usr/lib/udev/rules.d/71-hw1.rules
}
