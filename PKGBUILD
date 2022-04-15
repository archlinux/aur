# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver}.tgz")
sha512sums_x86_64=('5ae9f602e4d2f5a09f53c47ce53ec3027df33cbb583cba0e4cebe16cbae8ffaff0c7b08e05ecb03531d6a9f81c7059ffb14f339a84b39c5721069a30a401ab75')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/README" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"
}
