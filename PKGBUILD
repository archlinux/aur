pkgname=tempesta
pkgver=0.0.42
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
source=(
  "https://github.com/x71c9/tempesta/releases/download/v0.0.42/tempesta-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/x71c9/tempesta/releases/download/v0.0.42/tempesta-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/tempesta" "${pkgdir}/usr/bin/tempesta"
}
