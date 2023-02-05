# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.8"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('c012aee912690e1fdaf0754317e90bafef832e33b664f71f2fb59d61a1a9bcbe')
sha256sums_aarch64=('0fa892b95d1af6e91dabec26d035f064fb4933f05815ee6e8a095a47eb0b57e3')
sha256sums_armv7h=('f28a56685bf9db1fe96545cc0e783a3553ba8684b65e10f1627cff7a9445473a')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
