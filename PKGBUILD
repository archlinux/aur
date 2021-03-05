# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.9.1
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
  f2dc988961c20ba68b8af10977458fbb3d5e76e9a4da7284a817c2f0503e530e
)
sha256sums_armv6h=(
  f4a0a73f5b09cbfafbc3e0911c43b0a832d8fc9b608becd8d0d91344dfc9425a
)
sha256sums_armv7h=(
  f4a0a73f5b09cbfafbc3e0911c43b0a832d8fc9b608becd8d0d91344dfc9425a
)
sha256sums_aarch64=(
  7adbba446ddb7e0aace79d6c4d521a381f25175fb209c275910c72652f5f8dcb
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
