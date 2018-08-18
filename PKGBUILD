
# Maintainer: Christopher Lopes <christopher [dot] lopes [at] pm [dot] me>

pkgname=glyph-bin
_pkgname=glyph
pkgver=0.3.1
pkgrel=1
pkgdesc="A static site generator utilizing Github issues and pages."
arch=('x86_64')
url='https://github.com/dbriemann/glyph'
license=('MIT')
source_x86_64=("$url/releases/download/v$pkgver-beta/$_pkgname")
sha256sums_x86_64=('87409c27020bc7db3f25c3a9b1761ecccea0c58d5a8f3dcf952f3a990f7edc9c')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
