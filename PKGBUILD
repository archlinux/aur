# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-lazyarray
pkgname=('python-lazyarray' 'python2-lazyarray')
_name=${pkgbase#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="a Python package that provides a lazily-evaluated numerical array class, larray, based on and compatible with NumPy arrays"
arch=('any')
url="https://pypi.org/project/lazyarray/#files"
license=('BSD')
makedepends=("python" "python2" 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package_python-lazyarray() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

package_python2-lazyarray() {
  depends+=('python2')

  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

