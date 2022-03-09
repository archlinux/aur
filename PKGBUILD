# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli
pkgver=0.0.2
pkgrel=1
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MPL')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64")
sha512sums=('195d3dade0dbdecf5bea538e298a4091d936bc3e714a478d33ca4af40b972288c817b2dcf7621fb594216f61e423900a22aaae2af004198501c7721d4ade4b47')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
