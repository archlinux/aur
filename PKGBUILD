# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.2"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('88ab17937c07142ff88a3b7757aa1d35498cfb82b3c71e1b92c9cf99b77d1478')
sha256sums_aarch64=('d21c1ba8b11c535f5169825479bc5e45147641fd3a72932501f44b457d29df9e')
sha256sums_armv7h=('23641359c0f4bfc70bdd36e5039dd3991cba0f571062b49d847926b9ba7b254e')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
