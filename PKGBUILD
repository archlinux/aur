# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=notp-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="One Time Password Generator"
arch=('x86_64')
url="https://github.com/kondanta/notp"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("${pkgname%-bin}::$url/releases/download/v$pkgver/${pkgname%-bin}_linux")
sha512sums=('89d717d71233dcc418e36af66929a3c38ae78195d2656d8f77732fd7bf3062fff1f0592868a1473fde2168f181e896e98f2afc8c277bcfeeeb01b923e3c73b7d')

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/${pkgname%-bin}"
}