# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=cp2k
pkgname=${_name}-bin
pkgver=3.0
pkgrel=1
pkgdesc="A quantum chemistry and solid state physics software package for atomistic simulations of solid state, liquid, molecular, periodic, material, crystal, and biological systems. (precompiled, OpenMP)"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::https://sourceforge.net/projects/${_name}/files/precompiled/${_name}-${pkgver}-Linux-x86_64.ssmp/download")
md5sums=('1b1d72465475bfb5a9b0e009dd129425')

package() {
  cd "${srcdir}"

  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"
}
