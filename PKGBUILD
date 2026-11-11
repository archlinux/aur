# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver=2.39.1
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
sha256sums_x86_64=('1251f499f617d765cadaadf11fa6d55c6f022cf1f0828d10cde376c10b460ada')
sha256sums_aarch64=('23e79b6db13f9ed2663d43219eee49d5dd5199cf34df1daef41666ffbd9694b6')
sha256sums_armv7h=('291bfc52c70d4f00ecd6e6ddaa7ab1b352a47e1fc2e77028f28940a5be1958ce')
