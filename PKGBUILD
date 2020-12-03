# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.4.2
pkgrel=2
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
  f5d82a8d35fcfed8e484078c144879f08f31476d0e59394a7752b6e58be913ac
)
sha256sums_armv6h=(
  41e0b7a647cc1c60b0404843ef66ffc892447841279224fa9c081015a8dc7c19
)
sha256sums_armv7h=(
  41e0b7a647cc1c60b0404843ef66ffc892447841279224fa9c081015a8dc7c19
)
sha256sums_aarch64=(
  41cd46864003f86fc9047a0dba8c768ac1bbab8cb5a6aef5f718fb7051bce46a
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
