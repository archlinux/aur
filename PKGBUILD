# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.6
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
  66da0ddc441ebf9489704f81babc50a1cee3da139cfb0c9e7c9ef5186ab72cbe
)
sha256sums_armv6h=(
  c76ee91a1464f51b52438cadb035bbea4071a3ccdce5a554e5f764feb3dee382
)
sha256sums_armv7h=(
  c76ee91a1464f51b52438cadb035bbea4071a3ccdce5a554e5f764feb3dee382
)
sha256sums_aarch64=(
  e32e284797db10ec2c7d963b6be8a087e5853ddf2e7cfc098b7a78be3d64ddcf
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
