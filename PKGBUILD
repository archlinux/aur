# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.4.3
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
  
)
sha256sums_armv6h=(
  f5641f3460730f8aacd240ab44d6fd1211a20a3affb85d4b5273de8582f6b4a3
)
sha256sums_armv7h=(
  f5641f3460730f8aacd240ab44d6fd1211a20a3affb85d4b5273de8582f6b4a3
)
sha256sums_aarch64=(
  46d69398cef445da2407d6032ec7a7b783f6391a2e36f0cce26bcec7666f13a3
)

package() {
	install -Dm755 flux "$pkgdir/usr/bin/flux"
}
