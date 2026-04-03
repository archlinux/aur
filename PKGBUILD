# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=clc-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='A command-line tool for converting between configuration file formats'
arch=('x86_64' 'aarch64')
url='https://github.com/alchemy/clc'
license=('MIT')
provides=('clc')
conflicts=('clc')
options=(!debug)

source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/clc-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/clc-linux-arm64")

sha256sums_x86_64=('6fb7321d0971a9a5d86004aa1616b37cf4f6cd731590a5a5ea3cb4550fadeb73')
sha256sums_aarch64=('dd9462915361de550499c8ea65f624a17dcde08457bbeb3baa73c132f302be7e')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/clc"
}
