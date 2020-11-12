# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-server-bin
pkgdesc="Core backend infrastructure of the PassWall platform"
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-server"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('84d10e6cd318860d61d7e820f24125756eb6b6d74a4f8848a0cc5a6341c7f669')

package() {
  install -Dm 755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
