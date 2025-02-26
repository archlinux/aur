pkgname=tempesta
pkgver=0.0.40
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
source=("https://github.com/x71c9/tempesta/releases/download/v0.0.40/tempesta-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/tempesta" "${pkgdir}/usr/bin/tempesta"
}
