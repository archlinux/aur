# Maintainer: ULTRV <hello@ultrv.com>
pkgname=ultrv-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal client for the ULTRV blogging platform"
arch=('x86_64')
url="https://ultrv.com"
license=('MIT')
provides=('ultrv')
conflicts=('ultrv')
source=("https://dl.ultrv.com/cli/v${pkgver}/ultrv-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b3b80aa924331534eba5042ac576824b772233a56d8e1976be4e9d7515fae580')

package() {
  install -Dm755 ultrv "${pkgdir}/usr/bin/ultrv"
}
