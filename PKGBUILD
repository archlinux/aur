# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.1
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
  a613bbfe43af51ebf151a1239f61d5d22ecd76069d7aaad9b3acb7166586d385
)
sha256sums_armv6h=(
  7ecedb9eb44936fc0143b2f7bffe582c182d749061dcf20f32b428c09ae20e3a
)
sha256sums_armv7h=(
  7ecedb9eb44936fc0143b2f7bffe582c182d749061dcf20f32b428c09ae20e3a
)
sha256sums_aarch64=(
  24a7e58d7e8ffa2940e559af9906090616cf90e0eba30ac4bb842bd05a8c0fc2
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
