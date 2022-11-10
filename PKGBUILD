# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.12.6"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('5b469f61ab894974fb410904165ebacd915a50fdf855479197643b4869473473')
sha256sums_aarch64=('e78e1b3fdaa3387fc92713831a6eeba86f88462c4dab1496106511735a19e6e0')
sha256sums_armv7h=('8f047b5aca3691c9bcb15945d4337a83a9f9db15d5f46efcd45f4c5ea5c128d1')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
