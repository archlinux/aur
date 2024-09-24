# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.15.0"
pkgrel=2
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
sha256sums_x86_64=('ccce65def90b2ae0dd6474e055361fbdf61318b0a90e70361990e1e4f2d0f6bb')
sha256sums_aarch64=('d77159735ccc99ac5f0e9d1b5c11737f681c3bac24880f77d82e66f68a27d864')
sha256sums_armv7h=('4087b1f0e7190942ad1f0b179be4774b169414e51f78386f61fe2d1656ffd838')
