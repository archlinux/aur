# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.3
pkgrel=1
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
  4cd79b8ed20dd4dfb76eaadd43d2c1ed01daa53af77aab9bf60af42068411c73
)
sha256sums_armv6h=(
  cd8ecd14701761e6b2afb906926877239bb4fcad14bd629aa722de9b2ed16673
)
sha256sums_armv7h=(
  cd8ecd14701761e6b2afb906926877239bb4fcad14bd629aa722de9b2ed16673
)
sha256sums_aarch64=(
  a875e4790e1603aa7b17b979dbbfb6d7ae3d2b8ec9a75a71204cc46b5f849e9e
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
