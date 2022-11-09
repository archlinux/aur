# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.3"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('c944bc5540e9525a3a9923ca939f9c0d5aab57695d24591bbe817d329c779832')
sha256sums_aarch64=('22b83a1d476b395069d2491af26cd353c02b6113d3d9af7cb250ccfa5e177ece')
sha256sums_armv7h=('59a3628ce8fd43f1220eea7f0d55091dc1c850cd70ce0f05a445e55889513ac3')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
