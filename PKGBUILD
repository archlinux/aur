# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.9.10"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("448b3b770f77e8e66807534d5ca077d7ac1d771fe872e5ecf9d8629a900c1c52")

source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=("6cdfbcb343ab91e21489e4237456d8875ce3ed67819fa4f14d6d5b972025723d")

source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=("c5b6158ddd94c99bd4a9ba63e13ec760bf8bbb7d3062d7cc16d0b36c4fa307f9")

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
