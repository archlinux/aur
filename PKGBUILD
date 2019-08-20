# Maintainer: Christophe Coquelet <coqueletc at gmail dot com>

pkgname=rofi-autorandr
pkgver=1.0.6
pkgrel=0
pkgdesc="Autorandr integration for rofi"
arch=('x86_64')
url="https://github.com/pawndev/rofi-autorandr"
license=('MIT')
depends=('rofi' 'autorandr')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pawndev/rofi-autorandr/archive/${pkgver}.tar.gz")

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/rofi-autorandr.sh" "$pkgdir/usr/bin/rofi-autorandr"
}
md5sums=('738b24f32ac9168abd64901757d237cf')
