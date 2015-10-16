# Maintainer: Benedict Etzel <developer@beheh.de>

pkgname=steamcontroller-udev
pkgver=1.0
pkgrel=1
pkgdesc="Udev rule for Valve's Steam Controller"
arch=('any')
url="http://store.steampowered.com/universe/controller/"

source=(99-steamcontroller.rules)
md5sums=('1bcb37a4a9f30ac3cc0a307536a8bfba')

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -Dm 644 99-steamcontroller.rules "$pkgdir"/usr/lib/udev/rules.d/99-steamcontroller.rules
}
