# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=1.3.2 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('c399b06d8420a80534ed3e3ebd469891c569f17b4c14dca71935778c9423005c')
sha256sums_x86_64=('5fb14ad6dd3e4ae046812b01ba16140a4711f0bb4240c8dba65a390752d2ba1d')

package() {
	install -Dm755 "pass-cli-linux-${CARCH}" "${pkgdir}/usr/bin/pass-cli"
}
