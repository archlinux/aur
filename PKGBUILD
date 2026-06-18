# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=extism-js
pkgname="${_pkgname}-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="Extism JavaScript PDK Plugin Compiler"
arch=("x86_64" "aarch64")
url="https://github.com/extism/js-pdk"
license=("BSD-3-Clause")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("binaryen")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux-v${pkgver}.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux-v${pkgver}.gz")
sha256sums_x86_64=('4ded271ccf465031ccd0dc35e7a140e134d7f30721671cc4a8e1ff805d4aad68')
sha256sums_aarch64=('15a186250e68d6bff4ec839fff275d45a90e383a69209dcc1239eb9e3aee6e1b')

package() {
    install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}
