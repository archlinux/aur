# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.8.1
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
  cbd7eb4899133eb56d7ba7db4317429771d129f7d9c594286c9930f071c3f74b
)
sha256sums_armv6h=(
  af6a1e2c6ce99b22fe845f7f5feb5ffe6868194109f0d64ab10f58923fc0dcd2
)
sha256sums_armv7h=(
  af6a1e2c6ce99b22fe845f7f5feb5ffe6868194109f0d64ab10f58923fc0dcd2
)
sha256sums_aarch64=(
  a1d2263a41a74ccc33006f2564ba09fcb35acb88901cb94fa428807cb209d503
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
