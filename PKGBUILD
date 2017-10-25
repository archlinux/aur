# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=cp2k
pkgname=${_name}-bin
pkgver=5.1
pkgrel=1
pkgdesc="A quantum chemistry and solid state physics software package for atomistic simulations of solid state, liquid, molecular, periodic, material, crystal, and biological systems. (precompiled, OpenMP)"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
provides=("${_name}")
conflicts=("${_name}")
source=("https://sourceforge.net/projects/${_name}/files/precompiled/${_name}-${pkgver}-Linux-x86_64.ssmp/download")
md5sums=('e63ef9cfec73fc1efad36bb206de0077')

package() {
  cd "${srcdir}"

  mv download "${_name}"
  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"
}
