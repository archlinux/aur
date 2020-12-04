# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.4.3
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
  6ecc8f3f53383a29a4c07c07b31e18a02eacd368b16899e6c52c63c13ca87aa9
)
sha256sums_armv6h=(
  f56ef906f9b82c81afff6f74df2876d4ff56c3906127216dc100996af1b19eb5
)
sha256sums_armv7h=(
  f56ef906f9b82c81afff6f74df2876d4ff56c3906127216dc100996af1b19eb5
)
sha256sums_aarch64=(
  9ae02ef14bbfbf494ce706da7ff34d61457d62dca3e247c5db65512d68e40eff
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
