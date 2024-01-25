# Maintainer: ArcanusNEO <admin@transcliff.eu.org>

_repo=lukas-blecher/LaTeX-OCR
_pkgname=pix2tex

pkgname=${_pkgname}-desktop
pkgver=2.0
pkgrel=1
pkgdesc='Using a ViT to convert images of equations into LaTeX code (desktop icon).'
arch=(any)
url=https://github.com/$_repo
license=(MIT)
depends=(pix2tex)
source=(
  "${_pkgname}".desktop
  "${_pkgname}".svg::"https://raw.githubusercontent.com/${_repo}/main/pix2tex/resources/icon.svg"
)
b2sums=(
  '7e3a7828d3d8541a265219d4667db3a278d341c9efc02cfeff6877a60fb223ead970cb04b0ac817e226bccb93e801fd0ea97492a66bd15e5adb1e95f2f52fa2b' 
  'SKIP'
)

package() {
  install -Dm644 "${srcdir}"/"${_pkgname}".svg -t "${pkgdir}"/usr/share/icons/
  install -Dm644 "${srcdir}"/"${_pkgname}".desktop -t "${pkgdir}"/usr/share/applications/
}
