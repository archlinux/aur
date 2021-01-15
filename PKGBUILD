# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.6.0
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
  63c19129e27b4a72f1552933bffad571af3c74a9b879b6182d4dbad64e9cd9b7
)
sha256sums_armv6h=(
  e8bfaf37d4d9da1212590f211c7313d7911eafe35944aad0ebbcf2a91e197877
)
sha256sums_armv7h=(
  e8bfaf37d4d9da1212590f211c7313d7911eafe35944aad0ebbcf2a91e197877
)
sha256sums_aarch64=(
  c435a3c06f5f39561783794d9781c6c952ee9df24f289cbfdff1868a5f9f2e3b
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
