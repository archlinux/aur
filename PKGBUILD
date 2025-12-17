# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=1.3.1 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('20012e31c5af260eaa16cc7610c94200a8b34e5f68d559837530f1a1e51dfb13')
sha256sums_x86_64=('22f916541e5d35758660fae357c939e3719d5b63f9e82ab0666b6affe1a2fc13')

package() {
	install -Dm755 "pass-cli-linux-${CARCH}" "${pkgdir}/usr/bin/pass-cli"
}
