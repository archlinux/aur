# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl-bin
pkgver=1.0.14
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('e0ff2dd4aa3692789e4937294289e2c319c1eb879793601b4091eb44a19df353')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
