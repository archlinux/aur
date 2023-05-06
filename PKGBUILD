# Maintainer: ArcanusNEO <admin@transcliff.top>
_repo=lukas-blecher/LaTeX-OCR
_pkgname=pix2tex

pkgname=${_pkgname}-desktop
pkgver=1.0
pkgrel=1
pkgdesc='Using a ViT to convert images of equations into LaTeX code (desktop icon).'
arch=(any)
url=https://github.com/$_repo
license=(MIT)
depends=(python-pix2tex)
source=(
  "${_pkgname}".desktop
  "${_pkgname}".svg::"https://raw.githubusercontent.com/${_repo}/main/pix2tex/resources/icon.svg"
)
sha512sums=(
  'a7f9b51fc41fb2a908b7979ad116c792ad56b1f6b7587dd5b7d6101d1ea5a8754c428c5234f52f335b692b38ccb509865ab12a667606951e3879a7d0fdd61adf' 
  'SKIP'
)

package() {
  install -Dm644 "${srcdir}"/"${_pkgname}".svg -t "${pkgdir}"/usr/share/icons/
  install -Dm644 "${srcdir}"/"${_pkgname}".desktop -t "${pkgdir}"/usr/share/applications/
}
