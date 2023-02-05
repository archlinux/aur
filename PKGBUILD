# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.13.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('2ea53187b5e23613eef9689cee7b621dfb74bec7501a4ae54f0fc02a5b2dd5d3')
sha256sums_aarch64=('7065b0e4c8cf20daab4007987f1576a9c522dcbaea3ab8533cbf558af82e0d48')
sha256sums_armv7h=('6b3bbc29a72b1a0a3891a5e09937e8a885591bda22abc44dafef54cde35afca2')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
