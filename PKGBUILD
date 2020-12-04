# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.4.3
pkgrel=4
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
  c738037fb209f3d2ae3266641f1857fe36483022a0fd3f0439a45ff5a5dd78bd
)
sha256sums_armv6h=(
  0824b8fb6941f61f1f0a9796c08030de58137aeb7faea06c55a895c305aa9911
)
sha256sums_armv7h=(
  0824b8fb6941f61f1f0a9796c08030de58137aeb7faea06c55a895c305aa9911
)
sha256sums_aarch64=(
  563180685a7e2a2dcaf5faceba8f10a26843b1fe7751b205a708e97000ac0dae
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
