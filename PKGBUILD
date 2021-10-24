# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver}.tgz")
sha512sums_x86_64=('7902de590a74bebe521f8f896354f36a45a2accc88e0572ece1741c8e081c1d0c0b78d7867a6e0158b44e00d8e9de60c927118d0ee648fa50c39cb40d63412bb')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/README" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"
}
