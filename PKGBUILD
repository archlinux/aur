# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('6dfb82dd2e4988e83d6f1cdd06639bff3e67c19adc6c0d99a81c8058da6ee1e8')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}
