# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.10.2"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('8a21ca53478065438632ab93b8b1f8e7564fbf178224883219b5e4ef6f5fc1cc')
sha256sums_aarch64=('09464dcb235ccf922b8d0d0769ad24a98e5ca1375690309cac74c8bfb8f528f6')
sha256sums_armv7h=('158b5f28873108425c8136ee971097420ce9b919a558e09733ff033f08359aff')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
