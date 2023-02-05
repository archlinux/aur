# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.13.2"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('151817240111fbdbc5cd0fd33382b5e2333ed0313d7dbd817f2502b42fe82ea0')
sha256sums_aarch64=('e0a9303f455816ccd452420f55af66e4bd199451a717a3bf1eff2e64e8ef9131')
sha256sums_armv7h=('15b55e4d7c4c4108567c1e58532a36e0ee7482918841a5844159da0e47f6f07c')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
