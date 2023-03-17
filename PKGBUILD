# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.0.29
pkgrel=1
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MPL')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()
conflicts=('mcap-cli')
provides=('mcap-cli')

source=("${pkgname}-${pkgver}-x86_64::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64")
sha512sums=('a936e3f5242e7c12e2e379398c00a335c2a415724901d43cb9ac3ca4e877625ef169570ddfe32912ca6bb8591fc0d202693cc42422eb2bc95f8cd53621e78d1c')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
