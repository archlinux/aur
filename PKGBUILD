# Maintainer: James McMurray <jamesmcm03@gmail.com>
# Project Owner: Bruno Garcia <b@aduros.com>

_pkgname="wasm4"
pkgname=wasm4-bin
_binname=w4
pkgver=2.4.0
pkgrel=1
pkgdesc='Build retro games using WebAssembly for a fantasy console'
arch=('x86_64')
url='https://github.com/aduros/wasm4'
license=('ISC')
depends=('npm')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/w4-linux.zip" "https://raw.githubusercontent.com/aduros/wasm4/main/LICENSE.txt")
sha256sums=('707e19424487f38c974da06046cf4016f170d00882ce650c581a4a7ea7d0b0a9' 'SKIP')
provides=('wasm4')
conflicts=('wasm4')
options=('!strip')

package() {
  install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
