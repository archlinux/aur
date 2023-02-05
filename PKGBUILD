# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.14.2"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('449b7c9c1908f83801408a87570e0e1abfc7148e87007423c464a49eb7f3be21')
sha256sums_aarch64=('db7ecdb73a7821a943e0655264c2205a84028491d1faddf06679f4fce89a60d8')
sha256sums_armv7h=('8d65d3525f6786403d90dc3114863d6433793420a0ba3e63403527b8a1614077')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
