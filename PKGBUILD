# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.5"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('e1ab2fa94bcf65dec7f48ed091cb7485dd7b75278e7eb33824305e0fee5c9ce9')
sha256sums_aarch64=('e4caa6181181902837bbc4604f4709f7910eb7e2a87e30ce47fcdc9a6f053e55')
sha256sums_armv7h=('42dbd56a58f223d7c5fced4c022762a76208b4351ace20ef890e927fdd8c471a')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
