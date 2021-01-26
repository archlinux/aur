# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.2
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
  fb225e35eb01a144ea918a19e35aee5c77c17a776719166933ded2b6900fd673
)
sha256sums_armv6h=(
  53d9329a1710261a135e9f2b4d20c83ef330ecf2565c0b06f332bfb55e2fa8e7
)
sha256sums_armv7h=(
  53d9329a1710261a135e9f2b4d20c83ef330ecf2565c0b06f332bfb55e2fa8e7
)
sha256sums_aarch64=(
  bf5e51bf58fb5495527ef4758e99786dd6de9ae6eb40c3ab7592b54600ff018f
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
