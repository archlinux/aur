# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.11.0"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('ae836ddb9c7fee4ed362a074073e7a4367b145a2a933f1ea5f679d3f55a7cdb0')
sha256sums_aarch64=('72165b7e6ba59ddb0ac7449c3dc99b3a03ac529b14b8857c961f5dc34d168056')
sha256sums_armv7h=('ec6cadc289608029c151fc757a8a7b0661060ee1f134999efebacb23bda916c3')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
