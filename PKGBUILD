# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli
pkgver=0.0.3
pkgrel=1
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MPL')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64")
sha512sums=('b7a53f5c5435e7520076dd559d3661c13a49349aef419163dd423c5ae1060dcbf9b6407656b0f1261e0c1f69b563f45a852030ec1e81b714e8f17e28f47ee4e1')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
