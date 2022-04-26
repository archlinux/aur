# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli
pkgver=0.0.6
pkgrel=1
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MPL')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()

source=("${pkgname}-${pkgver}-x86_64::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64")
sha512sums=('1a0065b511afcf0ed7948e9d40867ffc2126910cdba9f64f5cfd2c3fca9edc06b6b00be3851ac8843a49c3f3103530d86752d6023af39d5b46c074346b1e6ab8')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
