# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.15.1"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('1da3c761e23b1ff73741a0012f6c11e469d90004262b26c0e52912f3f9f97e84')
sha256sums_aarch64=('d14b5c93708e91e9de78ea1fecc19a6f7361ae9713bc598efa87db5fd67c7f3e')
sha256sums_armv7h=('47a88684c8ff2b998ead0b5055aa4a9894aab36f28e82fd130961adf74af17e0')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
