# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=clc-bin
pkgver=0.1.0
pkgrel=3
pkgdesc='A command-line tool for converting between configuration file formats'
arch=('x86_64' 'aarch64')
url='https://github.com/alchemy/clc'
license=('MIT')
provides=('clc')
conflicts=('clc')
options=(!debug)

source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/clc-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/clc-linux-arm64")

sha256sums_x86_64=('06dc48e400b32bf5c4ddfcfff5d6056a5c522d54cdc3889f01ffe60af75df6c7')
sha256sums_aarch64=('575692781f263b37cc3b44704680e191b920de6ba31bd6d051355e1be91b5f33')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/clc"
}
