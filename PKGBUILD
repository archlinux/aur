# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.13.4"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('86fefa555cec46176e1bff74faffe0391a7bfc79011427a5a7675987bbdae2ea')
sha256sums_aarch64=('f698138d7732f98310b2d810d8ea91f62a9375c22c3e155614b2d3ed8ecbce41')
sha256sums_armv7h=('4d0bbbf74d9058095cc713d04ab2f019c0391216fde1b4f7b19e325d2d3fea0c')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
