# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.16.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('a4ac31ee064deed06baa85d426de743b2bbfca381728532061082d4183f2adca')
sha256sums_aarch64=('ca54af77bdb9db842e46c77c0c86974d5bc64ab1f53ea6eeb4257078e41b925e')
sha256sums_armv7h=('1379a2d77c2f0aca3b1bdb95389ed0c5d117f5885e3390b7fcf134ad5bf32082')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
