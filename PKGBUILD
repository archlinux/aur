# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.4.3
pkgrel=5
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
optdepends=("kubectl")
source_x86_64=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_amd64.tar.gz"
)
source_armv6h=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm.tar.gz"
)
source_armv7h=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm.tar.gz"
)
source_aarch64=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=(
  3ffd0feb74bbbcc9f18759bce76735a1d119e492b55ac62777a9e56e8604de71
)
sha256sums_armv6h=(
  d2993707c1eb6e40e11ec176a5019012b0b5fffed47ba2caec74914b3ee79eed
)
sha256sums_armv7h=(
  d2993707c1eb6e40e11ec176a5019012b0b5fffed47ba2caec74914b3ee79eed
)
sha256sums_aarch64=(
  06f021a821ab5b38734f15e4078d95dc0185e86a3f75f31501e9178907f78512
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
