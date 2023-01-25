# Maintainer: Eric Engestrom <aur@engestrom.ch>

pkgname=stadia-controller-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect the Stadia Controller to your linux box'
arch=(any)
url='https://support.google.com/stadia/answer/13067284#linuxrule'
license=(unknown)
depends=(udev)
source=(udev.rules)
sha256sums=('2e03bb23d0be72a55ac18c591d85afe026cda10299eb9dabfb047803a79ad215')

package() {
  install -Dm 644 udev.rules "$pkgdir"/usr/lib/udev/rules.d/70-stadiacontroller-flash.rules
}
