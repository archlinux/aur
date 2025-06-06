# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.23.0"
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
sha256sums_x86_64=('ff4672d1c1e871a851acb462ffe2cadbdea03f975910d82e7225fe87d07228c1')
sha256sums_aarch64=('bd47c5129306797744fe1f627fff0fb8bdadda458901077c060ebf9b737e243d')
sha256sums_armv7h=('d015d27b9d92d359c9b4f1a1f1d576739823aa00a149d19b8d38429a3acfad25')
