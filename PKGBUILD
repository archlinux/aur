# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli
pkgver=0.0.9
pkgrel=1
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MPL')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64")
sha512sums=('394fe738de8d4d7b7d0396751421f75dd9947465ed93c2c3566ffb715f1461ebcba2120167132c8dac0b226fcd7d5b6ef87c070594d789312557860ef6714385')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
