# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.9.1"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
sha256sums_x86_64=('af8faefecfdd3a7d8687284444ebbc8b4dd0637540fdb2323bf623eca4aa89c6')
sha256sums_aarch64=('b6fa737c9f796187c263957889aca30266393c3c3ed6e1d4858e45de9bffd949')
sha256sums_armv7h=('fe74ff302fd2d203411a24b1c10928b96ef0c84b5ed283aac06066a9e2a603ef')
