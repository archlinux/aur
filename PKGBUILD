# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.13.3"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('2772f7cd2edb25b693d7a1cd69a8c73a67763bd04a79b24694e434fcd193ae53')
sha256sums_aarch64=('333b96c2b212465c21ee7a64ec4d3ef63cfaa46ac7a5613f99540cf3e26b2fc6')
sha256sums_armv7h=('e88ffd00eb4db5138af4b84c890e2fd9290118db1cbd1f9204211d32b5e98266')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
