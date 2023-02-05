# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.7"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('1255d930ee85e3b55c0e6704b941d137445e60bba72552d3bd94ac13125c39e5')
sha256sums_aarch64=('8100e4b9aac96b839945b5dbc15aa89c8b274a8362a7e57b57f055a1f8357905')
sha256sums_armv7h=('e454af57c01ca003fa9e784c948aa2b4178c3265a7b4038db898bdafa43cb293')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
