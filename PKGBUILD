# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.0.34
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
sha512sums=('18790e465d549f53c8ede9d18a56de788a67c849fa82c38b436a1c5ed73db7c3f2bc467ea5cef907eb72a4b149738824a75eb360f3e176be08ca2bfbe860f006')

#prepare() {
#}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 ${pkgname}-${pkgver}-x86_64 ${pkgdir}/usr/bin/mcap-cli
}
