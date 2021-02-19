# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.8.2
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
  a059f0ec09977b90a58096b299cb8c028d4236a7fb8901c0d1704f9c3055aabf
)
sha256sums_armv6h=(
  f17d66399149c89bd346de75691a5331522870f10daccc64bf66ba99731be749
)
sha256sums_armv7h=(
  f17d66399149c89bd346de75691a5331522870f10daccc64bf66ba99731be749
)
sha256sums_aarch64=(
  29e3ae29c9d1ad9b3d5884c894b51de319336e16b87e0040fb5bc97820989dea
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
