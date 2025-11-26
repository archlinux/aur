# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('Proprietary')

source_aarch64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('c143116fa7938b5e5e89e081ac3635c9e6e174b4fc0dd05d4b96456127b5ac72')
sha256sums_x86_64=('9434db3ec46700d74200b8ccc2da5fc71935a1e09c1ef62b863ece87d9b6944c')

package() {
	install -Dm755 "pass-cli-linux-${CARCH}" "${pkgdir}/usr/bin/pass-cli"
}
