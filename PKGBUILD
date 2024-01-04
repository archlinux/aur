# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.6.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('794acfd9fd49f4b814b8b48cc9bebbdb0b694a0b22676cd7eebd7af8aa507be2')
sha256sums_aarch64=('cb384adae913c6e238d797cc299addc01b154d5c4e9fdb172edf74e167cc74cd')
sha256sums_armv7h=('d32c01525d7507025e00995333ec53f2fc339d6de7842bc5cfc489be86f82d2a')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
