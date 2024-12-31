# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Cloak"
_name="${_Name,,}"
pkgname="preprocessor-${_name}"
_commit="1cebd9b7540d88915f40409b374dc4ee9fe9dd98" # r11
pkgver="r11+g${_commit::7}"
pkgrel=1
pkgdesc="Mini-preprocessor library to demostrate the recursive capabilites of the preprocessor"
arch=('any')
url="https://github.com/pfultz2/${_Name}"
license=('BSL-1.0')
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('8952ea8e8bd6c838a09c62c57dff357d7dc7e24a69d3e0815e1a9bac4161a6c9')

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${_name}.h" "${pkgdir}/usr/include/${_name}.h"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
