# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.28.3"
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
sha256sums_x86_64=('55fdd7e0d666ff86fb5c7b592476d95083f214d9286a1494c952c50030f7e4dd')
sha256sums_aarch64=('59c3eacd6d51a164187a5d1a375452cd7c2da0993b574c181b9b23026e8c7060')
sha256sums_armv7h=('3ed47cc274059f5cb5fc918ed45b64974073ab7bc64cd1c2e8d4588a825c04bc')
