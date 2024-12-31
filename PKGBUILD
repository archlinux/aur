# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="ZLang"
pkgname="${_Name,,}"
_commit="5bea72bf13def83f000b9f0398576a6102f78df6" # r10
pkgver="r10+g${_commit::7}"
pkgrel=1
pkgdesc="Plugin framework for namespace macros in C/C++"
arch=('any')
url="https://github.com/pfultz2/${_Name}"
license=('BSL-1.0')
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('dd7d6c590caa9670bd8ded21e391a02b03ad30dd0cc627a401c003d063c4bbda')

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
