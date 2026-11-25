# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver=2.39.5
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
sha256sums_x86_64=('be279de07fd225b8ac97b6b236afb51a108c9d32122cd4b975769930f6546556')
sha256sums_aarch64=('a1a9bd7f250ddb548bb663b9250f93e16d26335361c8f2ef43468969abe32b96')
sha256sums_armv7h=('7de5cf1ab291e8d9b3a00a428c149232c11ba4bbb63405e42de33ded45b1dc48')
