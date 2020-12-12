# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.5.3
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
  1182011aa1b81a49a84445c17ba94da49c578b8ce2f74efcb6accb3a9d3b9d81
)
sha256sums_armv6h=(
  828be42eda25cd1dde88a8ded310b9acaac3314c6b69275da68de4d1d3dc095a
)
sha256sums_armv7h=(
  828be42eda25cd1dde88a8ded310b9acaac3314c6b69275da68de4d1d3dc095a
)
sha256sums_aarch64=(
  e7e65b2f9fe5cf19acb9e52d50e4d0722e78424ccacaa1fa5dc206a21cd8505a
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
