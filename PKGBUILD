# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.1
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
  02b428caf577a82cc4e99ca1329935d6c3d5e3c583d02a844b167f3a635d978f
)
sha256sums_armv6h=(
  f21e3c83aa3c41470caa003f530b6437bb4b4c5319f48a24f4de5ae1d09e6999
)
sha256sums_armv7h=(
  f21e3c83aa3c41470caa003f530b6437bb4b4c5319f48a24f4de5ae1d09e6999
)
sha256sums_aarch64=(
  5aef616385e88a1324587094a21879cfe07d91b3c2e540ed45a576f944aa4eae
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
