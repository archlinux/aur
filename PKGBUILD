# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=muffet-bin
pkgdesc="Fast website link checker"
pkgver=2.11.0
pkgrel=1
arch=('x86_64')
url="https://github.com/raviqqe/muffet"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_linux_amd64.tar.gz")
sha256sums_x86_64=('cd6824367b4d03210ff2f71c1a03865ba6357a63c0a02576bb7ed432b915236b')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
