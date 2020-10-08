# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ali-bin
pkgdesc="Generate HTTP load and plot the results in real-time"
pkgver=0.3.4
pkgrel=1
arch=('x86_64')
url="https://github.com/nakabonne/ali"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('43eb81eaae9c380078e2695c666c55770046a233970c2dd3fbc80b67d67d45df')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
