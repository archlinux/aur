# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl-bin
pkgver=1.0.10
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('6b753dfa112594ef7a1f8fbafca0f6da2f4a04c68283e76ceabf1105be75ff68')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
  install -Dm755  "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
