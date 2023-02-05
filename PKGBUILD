# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.14.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('854d97f1da1181f1612bfda10518ef98f68a6c366e20b2f88baff86f1d3ec8a6')
sha256sums_aarch64=('f194fe9e26f15ae5863af1e19945bd432543840c27f3f05712053f567f2aacfc')
sha256sums_armv7h=('9b75494f747463925c26f2388f0b08d31ddc65b638577ace529402cc2d471944')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
