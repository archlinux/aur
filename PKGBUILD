# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.5
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
  b41408c242cb9d020d1a3187b794757568e4ccf8526d1424055354735a2b6941
)
sha256sums_armv6h=(
  7035497737bed36e630392d23d91605ad47dfe2c21ef069247b77560a8e45461
)
sha256sums_armv7h=(
  7035497737bed36e630392d23d91605ad47dfe2c21ef069247b77560a8e45461
)
sha256sums_aarch64=(
  1b40de5a16688cb2d297e66536fa7c96b987d235c1f242bd891d6d1d8bb65b60
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
