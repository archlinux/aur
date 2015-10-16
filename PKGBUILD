# Maintainer: Benedict Etzel <developer@beheh.de>

pkgname=steamcontroller-udev
pkgver=1.0
pkgrel=2
pkgdesc="Udev rule for Valve's Steam Controller"
arch=('any')
url="http://store.steampowered.com/universe/controller/"
source=(99-steamcontroller.rules)
md5sums=('5202bfc89b0ff51f8b18854143db00f4')
install='steamcontroller-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -Dm 644 99-steamcontroller.rules "$pkgdir"/usr/lib/udev/rules.d/99-steamcontroller.rules
}
