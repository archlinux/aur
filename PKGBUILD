# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.2
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
  14ddd9c6ab813a1406641091c7ddd49cb27a125cb197765aac5ab908bd21461e
)
sha256sums_armv6h=(
  595558684f172c0bfd8466eeca457275405219a24b4ed0392792f7b8da43fbd3
)
sha256sums_armv7h=(
  595558684f172c0bfd8466eeca457275405219a24b4ed0392792f7b8da43fbd3
)
sha256sums_aarch64=(
  40e22b1eefe837844ee43e5e200c1de341084162c5353d09225b92390be0d9c6
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
