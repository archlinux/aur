# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.6.3
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
  93048c0c53589431b71901ab564ab8c5bc93dd81277a89a39ecb8dee62e28dfa
)
sha256sums_armv6h=(
  c761e60296e08379c5e089d3094a559b9898d55f10cca3f7361f7391492950c1
)
sha256sums_armv7h=(
  c761e60296e08379c5e089d3094a559b9898d55f10cca3f7361f7391492950c1
)
sha256sums_aarch64=(
  4b84bdc3336720b5e0e2a03ef5e3ea493193521bb0b34b7db99b4910d6a3c133
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
