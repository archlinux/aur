# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="PPLISP"
pkgname="${_Name,,}"
_commit="df06b8ac47623b6b2771e9481cff482b741d2c4d" # r8
pkgver="r8+g${_commit::7}"
pkgrel=1
pkgdesc="C pre-processor LISP"
arch=('any')
url="https://github.com/cospplredman/${_Name}"
license=('MIT')
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('c0c81f5a7f7f310066ba34b1d5c9242ebbac0c389710c392498078b5e5ce992e764aeb84bc20c32402bd93a1100942bb483a6801540b908a4ac3240a98b6bd2a')

# check() {
#    cd "${srcdir}/${_pkgsrc}/examples"
#   gcc ${CFLAFS} ${LDFLAGS} -E *.c
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${_Name}.h" "${pkgdir}/usr/include/${_Name}.h"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
