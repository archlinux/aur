# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.0.37
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
sha512sums=('9b7e96a47e1b1708d426bbc097bc510730a71f54be6293c98f26a505b84beb4836fc4c3b561c360f621a19b71bd2f2ecea6a81bc86fb3ab5a92176d94b23ec82')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
