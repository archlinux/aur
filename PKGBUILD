# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.8.1"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('aed15573eb2dc32f25f94cfa1a00c5d7ded33a9968a0279ba4184dbf33066a34')
sha256sums_aarch64=('3d53fea624df39e76dac90959fd05e9f51331b32500c25fc131917703f60679c')
sha256sums_armv7h=('f6219f7532d7bb2f55c6736709cb53ec56fdbb6d3c921df5fedc5ed0493d361b')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
