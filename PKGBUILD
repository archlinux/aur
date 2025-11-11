# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.27.4"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("Proprietary")
provides=('coder' 'coder-client')
conflicts=('coder' 'coder-client' 'coder-oss' 'coder-oss-client')

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
sha256sums_x86_64=('55db39793131fa6afcbd01b7a9666e91268a3e943e4d1efe78b974cecb99d3e0')
sha256sums_aarch64=('8602d449547d3f6b7b9c539e0a74ed0628e0cf4d904bc013efa6842a68b692ce')
sha256sums_armv7h=('48053c3c36fbdcd7f92361c33a57d05fd76bfcf4840f1f4085be9240d2c3c26f')
