# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.34.3"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("Proprietary")
provides=('coder' 'coder-client')
conflicts=('coder' 'coder-client' 'coder-oss' 'coder-oss-client')

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
sha256sums_x86_64=('8fbaf9aaea40b23900d75289a5d4c856da205af4b1cf9f6730ab534bdd8d3039')
sha256sums_aarch64=('6af0d403fdd12dca32b7a419dc2965be3369f0eeb983ed0290026330e39528b8')
sha256sums_armv7h=('964a7119f658d13ee193d01958987e1f19d15d01806cc7d419f741010f6e0519')
