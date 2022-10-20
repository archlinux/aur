# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.10.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('82430682fdd77953480459f0ad172db7e0fcb94243d0c913adcd654edc904339')
sha256sums_aarch64=('0a113cb90211b736ec52c5510bd3c7c8eb1ccd998a24fe32e6cf7455158f3eda')
sha256sums_armv7h=('4f13c23ddc5012966ad5d9323feddf874a5fe3f648e2dc170e502c6cf496c279')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
