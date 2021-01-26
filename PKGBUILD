# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.7.0
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
  fbb562eeb8364b37746d0b2d7e80465d464397ded73ae725994ca30d5a6ba15b
)
sha256sums_armv6h=(
  91512a58f391dfde9434fd58deebdf951625ce86c9fa7d9cdcfb9b2aeafbb7ae
)
sha256sums_armv7h=(
  91512a58f391dfde9434fd58deebdf951625ce86c9fa7d9cdcfb9b2aeafbb7ae
)
sha256sums_aarch64=(
  4c727a4bba6838391781976bfc2aa95a1a838c1cc880d61731127e7c7194990c
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
