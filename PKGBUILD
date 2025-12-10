# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=1.2.0 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('94499d54f82d8ebe61934155cc2a67b4cbfd1c6d6d3ce6c800cd2600b6c503dc')
sha256sums_x86_64=('c7dbdd16e7207b39a16f6d3938fad23bb2154341e3373a47180c68604526063e')

package() {
	install -Dm755 "pass-cli-linux-${CARCH}" "${pkgdir}/usr/bin/pass-cli"
}
