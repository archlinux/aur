# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fclones-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Efficient Duplicate File Finder"
arch=('x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver}.tgz")
sha512sums_x86_64=('59e6c645eb0eb203acea399b985962ba7625625d8fb01da543c2f68be4750540b2d9a48c758687cbbf3234e03333a9f4c6a2e090b9c5d0f063af5304d81e6156')

package() {
  install -Dm 755 "usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/README" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "usr/share/doc/${pkgname%-bin}/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"
}
