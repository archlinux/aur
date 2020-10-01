# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ali-bin
pkgdesc="Generate HTTP load and plot the results in real-time"
pkgver=0.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/nakabonne/ali"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1ad50aed67817ea048377d2144d88cf08ddc5e8a253d9ec4fed11a52b5b47851')

package() {
  install -Dm 755 ${pkgname%-bin} -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
