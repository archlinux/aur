# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.15.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('c681d5abb54d02a273f1a6443c55840352e55020bd196ccf49caabaadaa3d235')
sha256sums_aarch64=('73b84179b839560be5ccdffa6418e5d3131808451ac40abfe080d3807d7a0790')
sha256sums_armv7h=('58adc4caa24aa360bb63e82025980a691936731fc5732857f448806026fde255')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
