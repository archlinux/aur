# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.8
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
  ff268651004aa70d7612124c94377225edeb3eed28cdf23e206eb7f0a2560ba5
)
sha256sums_armv6h=(
  fcbb7b96b577fc9f863d0a566e2945a77ecbf51a65a08be2d1808307c8cf7a88
)
sha256sums_armv7h=(
  fcbb7b96b577fc9f863d0a566e2945a77ecbf51a65a08be2d1808307c8cf7a88
)
sha256sums_aarch64=(
  6ce85bc5b66da50ffb5ab2baeb38cc90fae3f54c5f2359ef30517b529af3005b
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
