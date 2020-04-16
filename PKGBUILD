# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl-bin
pkgver=1.0.9
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('9bbf73dfef4778bd6d3ccd4d524225a3c683a50dfce1dc3c8ea2c4993b1974cd')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
