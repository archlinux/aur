# Maintainer: Sergio Davies <newsletter dot sergio at gmail dot com>

pkgbase=python-quantities
pkgname=('python-quantities')
_name=${pkgbase#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc="Support for physical quantities with units, based on numpy"
arch=('any')
url="https://pypi.org/project/quantities/#files"
license=('BSD')
makedepends=('python-setuptools'
             'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0fde20115410de21cefa786f3aeae69c1b51bb19ee492190324c1da705e61a81')

package_python-quantities() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

