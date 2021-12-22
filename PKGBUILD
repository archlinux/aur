# Maintainer: James McMurray <jamesmcm03@gmail.com>
# Project Owner: Bruno Garcia <b@aduros.com>

_pkgname="wasm4"
pkgname=wasm4-bin
_binname=w4
pkgver=2.0.0
pkgrel=1
pkgdesc='Build retro games using WebAssembly for a fantasy console'
arch=('x86_64')
url='https://github.com/aduros/wasm4'
license=('ISC')
depends=('npm')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/w4-linux.zip" "https://raw.githubusercontent.com/aduros/wasm4/main/LICENSE.txt")
sha256sums=('745ab56762915068259e111493d859648a2c718d706c6fef4a340a69acf28e15' 'SKIP')
provides=('wasm4')
conflicts=('wasm4')
options=('!strip')

package() {
  install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
