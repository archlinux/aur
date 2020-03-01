# Maintainer: Sergio Davies <sergio dot newsletter at gmail dot com>

pkgbase=python-quantities
pkgname=('python2-quantities')
_name=${pkgbase#python-}
pkgver=0.12.3
pkgrel=1
pkgdesc="Support for physical quantities with units, based on numpy"
arch=('any')
url="https://pypi.org/project/quantities/#files"
license=('BSD')
makedepends=('python2-setuptools'
             'python2-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package_python2-quantities() {
  depends+=('python2')

  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

