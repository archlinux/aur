# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.9"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('6c12d5e9cc4e67b1714c15b4f297e660a112253d7d4d0905982c6735fa67003d')
sha256sums_aarch64=('e0e7e7ba772c8bdeba8b380a667d5f6445732a446a29625cf2759a60d23f4bf7')
sha256sums_armv7h=('ff3be3c4fcb60e1e79896ecd51e3f07fb9fed7899758368d0265a08787ba0162')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
