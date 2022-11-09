# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.4"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('17cb8cddc3ac824c66f74126bf5ebb6b241591b5d614483c79bfec8f23a77609')
sha256sums_aarch64=('4371bc4b1242d65d23678e18504d3629fcb2ed3f7df310f30bbb5ab278cde9f2')
sha256sums_armv7h=('e70cefed0eb728e363a3a6f3121b56136086b4cb54478332f54dc7e3b6181bda')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
