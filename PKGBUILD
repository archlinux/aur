# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-lazyarray
#pkgname=('python-lazyarray' 'python2-lazyarray')
pkgname=('python-lazyarray')
_name=${pkgbase#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="a Python package that provides a lazily-evaluated numerical array class, larray, based on and compatible with NumPy arrays"
arch=('any')
url="https://pypi.org/project/lazyarray/#files"
license=('BSD')
#makedepends=("python" "python2" 'python-setuptools')
makedepends=("python" 'python-setuptools')
conflicts=("python2-lazyarray")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('76964dd1384a6d020ae0e70806983d15d8fcd731734063f716696ebe300ab0af')

package_python-lazyarray() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

#package_python2-lazyarray() {
#  depends+=('python2')
#
#  cd "${srcdir}/${_name}-${pkgver}"
#  python2 setup.py install --root="${pkgdir}"
#}

