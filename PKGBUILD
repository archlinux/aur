# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=1.1.0 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('5314b666189ee697d631c0ac775208543158ed0db5023931b85120628ffec0e1')
sha256sums_x86_64=('369a9ec753bf0304a16e682ccde4d26a2af8e31b87314ba9aa2c56582b9720ef')

package() {
	install -Dm755 "pass-cli-linux-${CARCH}" "${pkgdir}/usr/bin/pass-cli"
}
