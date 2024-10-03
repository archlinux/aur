# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="2.16.0"
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
sha256sums_x86_64=('524f681a22d21c1088340cd083cf2d947c8cc3f3867dd982c36fcd5c9b39c1b4')
sha256sums_aarch64=('9d5d36b8ef9490d36f4032248761bef47f20be4f4339263222ee0ede7c246179')
sha256sums_armv7h=('b8bb4209818de2fcd9c08fefa1678baa154ed8f3a1d505c616a70eea48b04c63')
