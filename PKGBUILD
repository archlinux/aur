# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.13.6"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('303b8c35cdfb0778b1d7474dec8029bc3e8c745a809f51ef9db83f3cef8aee18')
sha256sums_aarch64=('870e623167d5924670e1644ec0198814389d85cc467b8b7755a111f59f5121ea')
sha256sums_armv7h=('accaeca36400d69dde2d7e27ee20dfd442d44c1124c1c20d70d6b5ef57d5bcd6')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
