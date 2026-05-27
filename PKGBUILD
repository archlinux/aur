# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.1.1 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("pass-cli-aarch64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('d76579e5191ea4a56d8e254898c9c6c5242a7f3a3a5204dccb88f34409e4c9fb')
sha256sums_x86_64=('97eeed17907674cfde7b397157f14f3ae0d1391c82732062971f4b1333559a8f')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
