
# Maintainer: Christopher Lopes <christopher [dot] lopes [at] pm [dot] me>

pkgname=glyph-bin
_pkgname=glyph
pkgver=0.3.1
pkgrel=2
pkgdesc="A static site generator utilizing Github issues and pages."
arch=('x86_64')
url='https://github.com/dbriemann/glyph'
license=('MIT')
source=("$url/releases/download/v$pkgver-beta/$_pkgname"
        'https://raw.githubusercontent.com/dbriemann/glyph/master/LICENSE')
sha256sums=('87409c27020bc7db3f25c3a9b1761ecccea0c58d5a8f3dcf952f3a990f7edc9c'
            'dad68ea093e446e0fddeb016cb84a03e5bf7bd77d7200a2e274779bf6a652dc5')
depends=(glibc)

package() {
  # License
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
