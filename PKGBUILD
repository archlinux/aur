# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.0.33
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
sha512sums=('cf720773e722ffeacb36f52e054e027620e736addb6ff10a01b9df00944a159e38ad703cc9eadf24eca36acbb2d96ce2ea11a888eb32d9fbcb7ed6e03b9f3cfb')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
