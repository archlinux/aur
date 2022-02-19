# Maintainer: James McMurray <jamesmcm03@gmail.com>
# Project Owner: Bruno Garcia <b@aduros.com>

_pkgname="wasm4"
pkgname=wasm4-bin
_binname=w4
pkgver=2.3.2
pkgrel=1
pkgdesc='Build retro games using WebAssembly for a fantasy console'
arch=('x86_64')
url='https://github.com/aduros/wasm4'
license=('ISC')
depends=('npm')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/w4-linux.zip" "https://raw.githubusercontent.com/aduros/wasm4/main/LICENSE.txt")
sha256sums=('013f06ce8c57f77770600473bfa3ec88b1237036cb99341bf551291bd95cf5d5' 'SKIP')
provides=('wasm4')
conflicts=('wasm4')
options=('!strip')

package() {
  install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
