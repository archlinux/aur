# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.9
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
  51897c86d688403d4eee96194122aeb383b2e4014c16f872cf4fa772fa83d17f
)
sha256sums_armv6h=(
  c77246aaadd5c4a3c58e8f6eed07905335f583b3b061b72be875c4b1d7d14b63
)
sha256sums_armv7h=(
  c77246aaadd5c4a3c58e8f6eed07905335f583b3b061b72be875c4b1d7d14b63
)
sha256sums_aarch64=(
  f4e2b2dbeddeb22fcf123b31fee9e0f512f52bee5c05242b9a38f3ce70c1c3ce
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
