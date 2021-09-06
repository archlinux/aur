# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver}.tgz")
sha512sums_x86_64=('af22e7aa43dfe7a36298a1b39bd1a5ace644d2b4d36013db7e6cb4d09c966c588f907d04b344b2c7d83d37470f1f751411c72e998a36bf84ed51f8e1f931a3cf')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/README" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"
}
