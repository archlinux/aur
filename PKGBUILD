# Maintainer: Christophe Coquelet <coqueletc at gmail dot com>

pkgname=rofi-autorandr
pkgver=1.0.7
pkgrel=0
pkgdesc="Autorandr integration for rofi"
arch=('x86_64')
url="https://github.com/pawndev/rofi-autorandr"
license=('MIT')
depends=('rofi' 'autorandr')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pawndev/rofi-autorandr/archive/${pkgver}.tar.gz")

prepare() {
  cd $srcdir/$pkgname-$pkgver
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/rofi-autorandr.sh" "$pkgdir/usr/bin/rofi-autorandr"
}
md5sums=('8893f11cdb4dbe8b17add87c8232028e')
