# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=cp2k
pkgname=${_name}-bin
pkgver=6.1
pkgrel=1
pkgdesc="A quantum chemistry and solid state physics software package for atomistic simulations of solid state, liquid, molecular, periodic, material, crystal, and biological systems. (precompiled, OpenMP)"
arch=("x86_64")
url="https://www.cp2k.org"
license=("GPL2")
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::https://github.com/${_name}/${_name}/releases/download/v${pkgver}.0/cp2k-${pkgver}-Linux-${arch}.ssmp")
md5sums=('8709f4978bbdfb5737923fa1f1eb8849')

package() {
  cd "${srcdir}"

  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"
}
