# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.36.0"
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
sha256sums_x86_64=('c7d7053fc0ff9f99203a65ee6bc0312c5112a884289a5a265226a2dcf0ed572e')
sha256sums_aarch64=('7a46837c1d4f131ab30ffd2880b77bf460177f2722c388e710e7cf4f9403b520')
sha256sums_armv7h=('65f3ddde0a6576b904f6e7cdafe178a1bd48a4a0d3f9cceca88e78131384d28a')
