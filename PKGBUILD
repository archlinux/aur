# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.15.3"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('2c88555777f1d9cc77a8f049093f4002472dc43d52b026e6784ef477bdced4a2')
sha256sums_aarch64=('cd4424fab24d697efc212f5d856c5a223c4cf4797722e48edf561c212d6900e6')
sha256sums_armv7h=('621edc83f923ae92a67fbbbf3a4772d9121f7637b22203c673c11a74e1b67aa1')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
