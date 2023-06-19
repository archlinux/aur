# Maintainer: Sergio Davies <newsletter dot sergio at gmail dot com>

pkgbase=python-quantities
pkgname=('python-quantities')
_name=${pkgbase#python-}
pkgver=0.14.1
pkgrel=1
pkgdesc="Support for physical quantities with units, based on numpy"
arch=('any')
url="https://pypi.org/project/quantities/#files"
license=('BSD')
makedepends=('python-setuptools'
             'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('efeafffc0c0364f891a9327239cd12496bccb55cd037a6d1bf44de706f722877')

package_python-quantities() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

