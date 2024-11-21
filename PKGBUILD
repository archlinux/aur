pkgname=rapidcsv
pkgver=8.84
pkgrel=1
pkgdesc="C++ CSV parser library"
arch=('any')
url="https://github.com/d99kris/rapidcsv"
license=('BSD')
source=("https://raw.githubusercontent.com/d99kris/rapidcsv/refs/tags/v${pkgver}/src/rapidcsv.h")
sha256sums=('85828a386ec331db48b67d8042a834ca35fd8ac58e8e70f72733689bc6383563')

package() {
  cd "$srcdir"
  install -d "${pkgdir}"/usr/include
  install -D -m644 rapidcsv.h "${pkgdir}"/usr/include
}
