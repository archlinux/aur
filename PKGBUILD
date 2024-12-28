# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="tuibox"
_commit="28035a91f23808024b4effccb47a0ae0d5b297b3" # r11
pkgver="r11+g${_commit::7}"
pkgrel=1
pkgdesc="TUI library, capable of creating mouse-driven, interactive applications on the command line"
arch=('any')
url="https://github.com/Cubified/${pkgname}"
license=('MIT') # https://github.com/Cubified/tuibox/issues/3
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('6536fabd710217144c09d66abdbed03b7e6bf3006b10bf320b316c16ce9a7ca6')

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
