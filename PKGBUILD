# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver=2.39.0
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
sha256sums_x86_64=('49bdd000dac448f110e23b9e0712cd5b51ca8a345f9c7061d59dd3cb526d4fe5')
sha256sums_aarch64=('acb7968d095440eca4bf3c82613df5fdd4bbce383fdc5737cacbe90df7411033')
sha256sums_armv7h=('897327674d250cfeace2f945fc163baf68185256b168672aeefc8b8640c447cc')
