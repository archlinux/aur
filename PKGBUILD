# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=clc-bin
pkgver=0.2.0
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

sha256sums_x86_64=('8a4400c04d8ff046cd4e9c498cb417b7d98ebf5a8de0cba444550f50a7207810')
sha256sums_aarch64=('1ed880470a87961162cb12fd39af41a8b546404415e1bc44f7bac52b63963ae6')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/clc"
}
