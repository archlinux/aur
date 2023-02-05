# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.14.3"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('4aee376549eec05049d495c5a14ffbf73d8047f9cbafa7ce227a3434197ebd88')
sha256sums_aarch64=('b7892693923636771264ebdf7277f8ac163bf90e3438bcea34c106861ce225a2')
sha256sums_armv7h=('96c8afadf5c5a9c71321cf6c0bf3f65d775c3cc9cb7d0508c877cca7ef629b29')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
