# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.1.0 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("pass-cli-aarch64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('e1481c47dc95fe241a42841414345afb2cd208520893f49a3c23897538293102')
sha256sums_x86_64=('5a775d5f83affbd8c1bcbf1517c38d1a157c160133e7136b00d5311bafe8ba93')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
