pkgname=vincentlaucsb-csv-parser
pkgver=2.3.0
pkgrel=1
pkgdesc="A high-performance, fully-featured CSV parser and serializer for modern C++"
arch=('any')
url="https://github.com/vincentlaucsb/csv-parser"
license=('MIT')
source=("https://github.com/vincentlaucsb/csv-parser/blob/${pkgver}/include/csv.hpp")
sha256sums=('bf30d556c1d628d527b0b96aac538a7db71806d5340ca2d387eb1827aadcb924')

package() {
  cd "$srcdir"
  install -d "${pkgdir}"/usr/include
  install -D -m644 csv.hpp "${pkgdir}"/usr/include
}
