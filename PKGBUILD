pkgname=atar
pkgver=0.0.1
pkgrel=1
pkgdesc="Ephemeral Terraform runner: applies on start, auto-destroys on exit or failure."
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/atar"
license=('MIT')
depends=('glibc')
source=(
  "https://github.com/x71c9/atar/releases/download/v0.0.1/atar-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/x71c9/atar/releases/download/v0.0.1/atar-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/atar" "${pkgdir}/usr/bin/atar"
}
