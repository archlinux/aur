# Maintainer: Mel Halsey nubia@nubiameow.com

pkgname=umu-shortcut
pkgver=v1.0.1
pkgrel=1
pkgdesc='Desktop entry and wrapper creator for UMU Launcher'
arch=('any')
url=https://github.com/NubiaMeow/umu-shortcut
license=('GPL-3.0-only')
depends=('python>=3.9')
optdepends=('umu-launcher: Wrapper execution')
source=('umu-shortcut')
sha512sums=('fa83bb861a8540823369ffab2223cc32d43e170de06ddccbf9d6195e5a02dd47a3712c613e5123fe0b6b2a4aaa99077ad29f370974aa0a3fe5bf7b3c91bff911')

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
