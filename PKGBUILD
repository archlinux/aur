# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.4
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
  5b2529be190b1e42c81eff539c770366439d2733fb0d91c8cc0cdd9276596399
)
sha256sums_armv6h=(
  fadc21c8d23dc44a5cae815f0efbab8d8dc96f050b4e674be992d886280c9bbe
)
sha256sums_armv7h=(
  fadc21c8d23dc44a5cae815f0efbab8d8dc96f050b4e674be992d886280c9bbe
)
sha256sums_aarch64=(
  2457c9362aec3a11e5725c626b7a567583acc48f0e67bbec501f8e365aca182f
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
