# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=muffet-bin
pkgdesc="Fast website link checker"
pkgver=2.10.7
pkgrel=1
arch=('x86_64')
url="https://github.com/raviqqe/muffet"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_linux_amd64.tar.gz")
sha256sums_x86_64=('e501e36c39567e3a681d6966bf141fdcd50c96cea58058f9c85ff5b95b41f8d6')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
