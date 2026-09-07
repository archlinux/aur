# Maintainer: vbmithr <vb@luminar.eu.org>

pkgname=rustfs-cli-bin
pkgver=0.1.34
pkgrel=1
pkgdesc="A S3-compatible command-line client written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/cli"
license=('Apache-2.0')
conflicts=('rustfs-cli')

source_x86_64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-arm64-v${pkgver}.tar.gz")

sha256sums_x86_64=('ff4631d5a6f472a46e64f0f0b5371b9d545b01bed22a2049188462699bd6d819')
sha256sums_aarch64=('d43aa94d640fbc02f9296ecc26a0c7f6292f1c1c0ebcf6c877886a30c78f9d39')

package() {
	cd "${srcdir}"
	install -Dm755 "rc" "${pkgdir}/usr/bin/rc"
}
