# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.7
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
  2fbbc5f8a7d91cf50540732cc81c20a9c83e5779b1b1ed68e03f45c91e67efca
)
sha256sums_armv6h=(
  e0a689f91f465e78f43ce196cd7fa9f65d99c81539103d69eabecd2d2cba5a23
)
sha256sums_armv7h=(
  e0a689f91f465e78f43ce196cd7fa9f65d99c81539103d69eabecd2d2cba5a23
)
sha256sums_aarch64=(
  1dcac062ffdd2ede4324077951532d752a94d7b1ada9778503a6d5be85b44c05
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
