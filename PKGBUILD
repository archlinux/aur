# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.6
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
  e6d40e831e6e0644fa76110fafa50c560f5805e238b5894043b02e1157b754e9
)
sha256sums_armv6h=(
  574853dc3ac5f1f23dce09896073e27107c69f79a48eec32d329157ae69ad493
)
sha256sums_armv7h=(
  574853dc3ac5f1f23dce09896073e27107c69f79a48eec32d329157ae69ad493
)
sha256sums_aarch64=(
  780a0859f386b7f582ff2b0a1a9b439d92c4ff3e1009ecdff9a76b98ec1a88a2
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
