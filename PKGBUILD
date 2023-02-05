# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.14.1"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('3538ed3dfd4cd729c6656d5609b523d5fcc1f60062217573d7325bf3aa2dcdb5')
sha256sums_aarch64=('d5472fa89169fd5c319a2516e5a50d809ab46239c20461803d4729c243a7e6d0')
sha256sums_armv7h=('351e1733b3b71302175a9286382b9e9c07365819bdebeaa91fbcc71732e41ef4')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
