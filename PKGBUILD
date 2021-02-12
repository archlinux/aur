# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.8.0
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
  a184fccfa52e978e3299fd276bd8d896ece96a7c08b1ac570a1b3218c7b4f6d9
)
sha256sums_armv6h=(
  f05584e1a04ac51c7e3101a7a5c43ec8efc78208a2c8bb357c39f4cbc2764278
)
sha256sums_armv7h=(
  f05584e1a04ac51c7e3101a7a5c43ec8efc78208a2c8bb357c39f4cbc2764278
)
sha256sums_aarch64=(
  0308d0e36ba3bfe20f61828a040f7d358fcf4175d962fb97882e67befb75b0d7
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
