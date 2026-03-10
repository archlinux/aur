# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=1.6.1 # datasource=github-tags depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'gcc-libs')
license=('proprietary')

source_aarch64=("pass-cli-aarch64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::https://proton.me/download/pass-cli/${pkgver}/pass-cli-linux-x86_64")

sha256sums_aarch64=('be68a5cbd6faba491d4436e7287472b2c9f76ef44585dcf10f260fa883044acf')
sha256sums_x86_64=('bbf4ba015b7d37d194cd8481649031ab3c4d5c54cb36db5f7ea2c05b7c8d28bf')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
