# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.5.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('e2ce7ea29bd610feb172f2f31083b4d8026c4f9f019fa4bdbc1841360aa1f200')
sha256sums_aarch64=('56c2b2fc8ebae725e2ad2e1cc3fdd23a9bfe6d7a3f51cc902b486c275823538e')
sha256sums_armv7h=('ec4597673d520da13e237d35e64c06f210f29e01c612167c782688a812c0ed69')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
