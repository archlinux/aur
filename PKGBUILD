# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=clc-bin
pkgver=0.3.0
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

sha256sums_x86_64=('f6737527cd9ffd8d8da941145728e4ce8e5076fed10ec5c2f574a545d6445da3')
sha256sums_aarch64=('4708dfdc467ea9003f018ec37968a38a6a46af282bd713a4b7e8805fe67b896a')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/clc"
}
