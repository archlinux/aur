# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.26.0"
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
sha256sums_x86_64=('da675af800396d5a312093f3a10f5bd9b3f17e5a3a3c6458e36597e7212a12bb')
sha256sums_aarch64=('58019fb6b6e3e8a8dcd5c039140bd8c4609aa2124ebf871e7aff5d35469898e2')
sha256sums_armv7h=('3ecc6d87170aafd5010bf05f44f77419e62dd54b37807e835da24ceff57362a8')
