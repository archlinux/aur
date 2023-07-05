# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Sergio Davies <sergio dot newsletter at gmail dot com>
# Contributor: a821

_py="python2"
_pkg="quantities"
pkgbase="${_py}-${_pkg}"
pkgname=("${pkgbase}")
pkgver=0.12.5
pkgrel=1
pkgdesc="Support for physical quantities with units, based on numpy"
arch=('any')
url="https://pypi.org/project/${_pkg}/#files"
license=('BSD')
makedepends=(
  "${_py}-setuptools"
  "${_py}-numpy"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '67546963cb2a519b1a4aa43d132ef754360268e5d551b43dd1716903d99812f0'
)

package_python2-quantities() {
  depends+=(
    "${_py}"
    "${_py}-numpy"
  )

  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py install --root="${pkgdir}"
  }

# vim:set sw=2 sts=-1 et:
