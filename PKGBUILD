# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.13.5"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('de6bc8fd198f98023cb4379cf857a0b33ef3b8493f151d4e0f3da0f49857f670')
sha256sums_aarch64=('5c539b6202aaec15f4bd2aca0a8ee33a3c3fd7c6a23bc1996a2211558b978869')
sha256sums_armv7h=('70557002e18ac6bf32b74fad8279d117b5f968fbb3dd66dcfcf37c40ce91cd7c')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
