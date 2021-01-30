# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.4
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
  1b8a8c3ad0768107ca2428dae11619cc1c160a1af19db3488961b1044a433dfc
)
sha256sums_armv6h=(
  0c95bca2d57bef6b70edc24188773161d6ca19a51a58d07b197e1f3cfd45f284
)
sha256sums_armv7h=(
  0c95bca2d57bef6b70edc24188773161d6ca19a51a58d07b197e1f3cfd45f284
)
sha256sums_aarch64=(
  4351c05ec69344a3b3df8981d897895f396a18b6d1e903bc9bb322ccb42c3dd6
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
