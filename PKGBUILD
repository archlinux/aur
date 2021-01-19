# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.6.2
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
  98911055d3faa52062bcfa8b19641e7b451f562a3dba4ada4bcb9ed8d9b92c28
)
sha256sums_armv6h=(
  a9643db7436c1c838fe36ff9d3f69e0700731f1535a3486b7390ea23dbfe8be1
)
sha256sums_armv7h=(
  a9643db7436c1c838fe36ff9d3f69e0700731f1535a3486b7390ea23dbfe8be1
)
sha256sums_aarch64=(
  6685e5a6e0cbfaf4cea579d57fffe2014cacb8a89f2d05af1997e575588b3b4d
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
