# Maintainer: vbmithr <vb@luminar.eu.org>

pkgname=rustfs-cli-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="A S3-compatible command-line client written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/rustfs/cli"
license=('Apache-2.0')
conflicts=('rustfs-cli')

source_x86_64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/rustfs/cli/releases/download/v${pkgver}/rustfs-cli-linux-arm64-v${pkgver}.tar.gz")

sha256sums_x86_64=('a4260ab56fb398749fc33fce7456bfd5e5b57c166f2ac59189a69095290c9db0')
sha256sums_aarch64=('9f4d69f5a0bd7df3d2a16772dc9911bf2ada96dd59790c6c841e7ab774342f2a')

package() {
	cd "${srcdir}"
	install -Dm755 "rc" "${pkgdir}/usr/bin/rc"
}
