# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.6.1
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
  8af93f0adc2517e7825227d31a0de89c78bfce496236707147fd51efda0f7702
)
sha256sums_armv6h=(
  32c9d815796d958241af8534785fdb3d40c7d542d81dcfd2dc844076475aec93
)
sha256sums_armv7h=(
  32c9d815796d958241af8534785fdb3d40c7d542d81dcfd2dc844076475aec93
)
sha256sums_aarch64=(
  120a9b87163446450123c76f74420ad31387b8ad99d6021b57209d8a6c2b8200
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
