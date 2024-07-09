# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aaaaxy"
pkgname="${_pkgname}-bin"
pkgver=1.5.173
pkgrel=1
pkgdesc="A nonlinear puzzle platformer taking place in impossible spaces"
arch=('x86_64')
url="https://github.com/divVerent/${_pkgname}"
license=('Apache-2.0')
depends=('glibc' 'alsa-lib' 'hicolor-icon-theme' 'libglvnd' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.zip")
sha256sums_x86_64=('c9edb67c9cee7310db967ed16c1e439b308cc6addbeada4ad35af24ca677833d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
