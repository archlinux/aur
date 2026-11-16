# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver=2.39.4
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
sha256sums_x86_64=('b6ea29c51854447e7534b43ab19eccd37e3ce1f66393a67c4ac4257f7bdff7bf')
sha256sums_aarch64=('884385b1fc5dd5caad8ba7568c6395bfddf8f74a6fb9015a410a2f9851a3b2cf')
sha256sums_armv7h=('d9218cad806871bcc920a562241a7d223cf81355eb756036becebb1b09b1cc4b')
