# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.9.0
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
  bf0a20749b339f70e464aab0554db055358b43cb174a8b1d40397d1ea448c145
)
sha256sums_armv6h=(
  d8c2ca5c164ca3b781d46011367ab11b0a2db51979ca7bb16ba8e1e71c707f4d
)
sha256sums_armv7h=(
  d8c2ca5c164ca3b781d46011367ab11b0a2db51979ca7bb16ba8e1e71c707f4d
)
sha256sums_aarch64=(
  9b79bbfeabda819536e667ab8b3c8153ce6476a14d6cc8a92f8efb72cc68822f
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
