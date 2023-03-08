# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.0.28
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
sha512sums=('eee301e08f7f1e97d337cc295584b565453520c2a4efe87b8798da4c2ba30c13bf860b13406ff75c78ab3a96d79af9883b58eb75edc22e96e497f48b90b0e961')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
