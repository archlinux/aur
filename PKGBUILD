# Maintainer: Robert Buchberger <robert@buchberger.cc>
pkgname=airbrake-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="The offical command line interface for interacting with Airbrake."
arch=("x86_64")
url="https://github.com/airbrake/airbrake-cli"
license=('unknown')
source=(
  "https://github.com/airbrake/airbrake-cli/releases/download/v${pkgver}/airbrake_${pkgver}_linux_x86_64.tar.gz"
)
sha256sums=('8262899ec15cbdd32a305477fa2824fc295fc1ca592bbf3aade8c345f6c5ef6f')

package() {
  install -Dm755 airbrake "$pkgdir/usr/bin/airbrake"
}
