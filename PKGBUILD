# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=httplz-bin
_pkgname=httplz
pkgver=1.9.1
pkgrel=0
pkgdesc='Host These Things Please - a basic http server for hosting a folder fast and simply'
arch=('x86_64')
url="https://github.com/thecoshman/http"
license=(MIT)
source=(
  ${url}/releases/download/v${pkgver}/http-v${pkgver}
  ${url}/releases/download/v${pkgver}/http-man-v${pkgver}.tbz2
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  SKIP
  SKIP
  SKIP
)

package() {
  install -Dm755 http-v${pkgver} "$pkgdir"/usr/bin/httplz
  install -Dm644 http-man-v${pkgver}/http.1 "$pkgdir"/usr/share/man/man1/httplz.1
  install -Dm644 http-man-v${pkgver}/http.1.html "$pkgdir"/usr/share/man/man1/httplz.1.html
  install -Dm644 http-man-v${pkgver}/http.md "$pkgdir"/usr/share/man/man1/httplz.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
