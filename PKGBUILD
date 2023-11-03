# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.3.3"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('de03bbd448a2dca0639ffa10d50dce089ed2e87d7688362339fa9fe37a61d674')
sha256sums_aarch64=('bfb4b6d88eb610a3dc1cef7264672228a7ed465cc8a307c079582771c39d952b')
sha256sums_armv7h=('c0744cb06208031dccc3460403a6a790783039517faa58c6888aad28a89f3d5d')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
