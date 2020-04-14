# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl-bin
pkgver=1.0.5
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('566257ee7c806f7f49491e7e3f9404d245f4346d7474ad934455630a6de20dfd')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
