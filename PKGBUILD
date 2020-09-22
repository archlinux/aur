# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ali-bin
pkgdesc="Generate HTTP load and plot the results in real-time"
pkgver=0.2.4
pkgrel=1
arch=('x86_64')
url="https://github.com/nakabonne/ali"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b6cbf8120f72c6a9648d15e23c3ad04b8d113d468d766ad4941d054c983e54f1')

package() {
  install -Dm 755 ${pkgname%-bin} -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
