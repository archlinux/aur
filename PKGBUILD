# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.5
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
  7db70083f3011daa6c29b79575a70f7e7030ebeb85af45f716ed3ec29f6ca249
)
sha256sums_armv6h=(
  7542258e20c58aa095c8cb45aac0eee686989e188391f9877f089ecb44457e4d
)
sha256sums_armv7h=(
  7542258e20c58aa095c8cb45aac0eee686989e188391f9877f089ecb44457e4d
)
sha256sums_aarch64=(
  e3d07e5e9f7e8a2ead892be71033aeff07afeab28b2b770354352d431c382e07
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
