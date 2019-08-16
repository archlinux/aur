# Maintainer: Christophe Coquelet <coqueletc at gmail dot com>

pkgname=rofi-autorandr
pkgver=1.0.4
pkgrel=3
pkgdesc="Autorandr integration for rofi"
arch=('x86_64')
url="https://github.com/pawndev/rofi-autorandr"
license=('MIT')
depends=('rofi' 'autorandr')
optdepends=()
source=("${pkgname}::https://github.com/pawndev/rofi-autorandr/archive/${pkgver}.tar.gz")

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/rofi-autorandr.sh" "$pkgdir/usr/bin/rofi-autorandr"
}
md5sums=('1a81c199b0a4edba8cec6954832d585c' '4f9cfbcc029192881a497d7d063730e8')
