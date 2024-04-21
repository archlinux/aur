# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.10.1"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
sha256sums_x86_64=('8cd3cbdf47b9c6fc9a8e522a8afb44a526f771185f80584b1650be09a2d8d883')
sha256sums_aarch64=('62d4b2299606f2f76e6d951fa36163128570485f364d7cde2c98cfa47aa01439')
sha256sums_armv7h=('d2c2569c9689fe1d89eb9b7a2532b5ea6c92e837a85ef39f3e5705b8b4e9fb07')
