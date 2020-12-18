# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.7
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
  c5bd4548548234c0de94ac94ebfae8506ff79fbff58170bacce0c34468a280d0
)
sha256sums_armv6h=(
  4c8cbb3a001536719b36060e8424f2946308c401b1e163e1889e5272c5bd1b26
)
sha256sums_armv7h=(
  4c8cbb3a001536719b36060e8424f2946308c401b1e163e1889e5272c5bd1b26
)
sha256sums_aarch64=(
  7137a561adfa1cb2917e9be8140df9c33177b1c0b1f843e00fcd75b689b6a51d
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
