# Maintainer: vbmithr <vb@luminar.eu.org>

pkgname=rustfs-cli-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="A S3-compatible command-line client written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/cli"
license=('Apache-2.0')
conflicts=('rustfs-cli')

source_x86_64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-arm64-v${pkgver}.tar.gz")

sha256sums_x86_64=('a2d359f9c1c934886e236eb264318bbab326cb67cfae718e3a5186c8cfae82fe')
sha256sums_aarch64=('e335fb5b71ee0fe473116e1ac313810b58c032a1a7f92c78ae77c3185a362022')

package() {
	cd "${srcdir}"
	install -Dm755 "rc" "${pkgdir}/usr/bin/rc"
}
