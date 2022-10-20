# Maintainer: Phorcys <aur@phorcys.net>
pkgname=coder-bin
pkgver="0.10.1"
pkgrel=1
pkgdesc="Remote development environments on your infrastructure provisioned with Terraform"
arch=("x86_64" "aarch64" "armv7h")
url="https://coder.com"
license=("AGPL3")

source_x86_64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/coder/coder/releases/download/v${pkgver}/coder_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('c22d1cf3f325cb68d7fac9dbdf86aaa9a4e37aa1a98e8ab39b0e27502201904b')
sha256sums_aarch64=('2031327c2074e8a31c2e7dc01ad878b7c64fc69a7383936c80744700da39e306')
sha256sums_armv7h=('cf45f5e98c9cabb434e6683dfc7fa4f8490d4e1f93c8bf51cd2b2e06514fa5ed')

package() {
	cd "$srcdir"

	install -Dm755 coder "${pkgdir}/usr/bin/coder"
}
