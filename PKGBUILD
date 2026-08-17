# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=extism-js
pkgname="${_pkgname}-bin"
pkgver=1.7.0
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
sha256sums_x86_64=('63b72da2f5e88655522dc21477de549f238a2f40546a69ce4e0fce7e78654035')
sha256sums_aarch64=('025f4050b199d68413c159bde1187271ae270021a9f7171e7beb509922821f2a')

package() {
    install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}
