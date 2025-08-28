# Maintainer: klpod221 <klpod221@gmail.com>
pkgname=kerminal-bin
_pkgname=kerminal
pkgver=0.2.1
pkgrel=1
pkgdesc="Modern terminal app with SSH/SFTP support"
arch=('x86_64')
url="https://github.com/klpod221/kerminal"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=(
  "${_pkgname}-${pkgver}.AppImage::https://github.com/klpod221/kerminal/releases/download/v${pkgver}/kerminal-${pkgver}.AppImage"
  "kerminal.desktop"
  "kerminal.png"
)

sha256sums_x86_64=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/kerminal.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/kerminal.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}