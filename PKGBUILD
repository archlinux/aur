# Maintainer: ns <arch@xnia.org>
pkgname=zsa-udev
pkgver=1
pkgrel=1
pkgdesc="udev rules allowing Wally and Live Training use with ZSA keyboards"
arch=('any')
url='https://github.com/zsa/wally/wiki/Linux-install'
license=('MIT')
depends=(udev)
install='zsa-udev.install'
source=('https://raw.githubusercontent.com/zsa/wally/master/license.md'
        '50-oryx.rules'
        '50-wally.rules')
sha256sums=('d2841d63f4e0bdfda102390ab1ca09136230d22f88538863b24b0c7fc68e548e'
            '1775109f94073f4be019beca1db86b09f9be87a822726885eb588a7641c13e15'
            '8f2b5019ef59005c3562e02ece5e7a8e2437cf20af01f8daf1ef38337fea1042')

package() {
  install -Dm 644 {"$srcdir","$pkgdir"/usr/share/licenses/zsa-udev}/license.md
  install -Dm 644 {"$srcdir","$pkgdir"/usr/lib/udev/rules.d}/50-oryx.rules
  install -Dm 644 {"$srcdir","$pkgdir"/usr/lib/udev/rules.d}/50-wally.rules
}
