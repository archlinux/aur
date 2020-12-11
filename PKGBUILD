# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.0
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
  0b304339ca41d237a26e3710e016c06979f02d6303506a87bc7984aaa61f179b
)
sha256sums_armv6h=(
  06f9b00d7a3282066073fc118b632119c80113ab105d4d9b44831539ed87a3d8
)
sha256sums_armv7h=(
  06f9b00d7a3282066073fc118b632119c80113ab105d4d9b44831539ed87a3d8
)
sha256sums_aarch64=(
  86d199328bccba6f23b0b828fc622ed6f991379b12b748e4fd17fe62b7153df0
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
