# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=1.5.1 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("pass-cli-aarch64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('4d0888ccde58f7787340a75b8f0d2cab86b28be29073574eec1f566f15cb0b2d')
sha256sums_x86_64=('f299dd87c33306dace620d6a5d939a5761e26c0eb2cabc8fdbf3732e0707acc0')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
