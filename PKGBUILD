# Maintainer: vbmithr <vb@luminar.eu.org>

pkgname=rustfs-cli-bin
pkgver=0.1.36
pkgrel=1
pkgdesc="A S3-compatible command-line client written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/cli"
license=('Apache-2.0')
conflicts=('rustfs-cli')

source_x86_64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-arm64-v${pkgver}.tar.gz")

sha256sums_x86_64=('4a8128911ccad4e7b481f26635a4cfd1ec064412210526e57ad2c748d356f3b7')
sha256sums_aarch64=('6e9dea7ac4f81562add9e1e31206ba6059d6f5929ad4ed924986223282b3aa9c')

package() {
	cd "${srcdir}"
	install -Dm755 "rc" "${pkgdir}/usr/bin/rc"
}
