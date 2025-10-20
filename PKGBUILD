# Maintainer: Debjeet Banerjee <serene.brew.git@gmail.com>
# Co Maintainer: Imon Chakraborty <serene.brew.git@gmail.com>
pkgname=espionage
pkgver=1.0.0
pkgrel=1
pkgdesc="ESP8266 and EPS32 firmware binaries analysis toolkit "
arch=('any')
url="https://github.com/serene-brew/ESPionage"
license=('BSD-3-CLAUSE')
depends=('python')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/serene-brew/ESPionage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=package.install

package() {
  cd "$srcdir/ESPionage-$pkgver" || exit 1
  ./install.sh --prefix=/usr --destdir="$pkgdir"
}
