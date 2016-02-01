# Maintainer: Luis Miguel García-Cuevas González <luismiguelgcg@gmail.com>  

pkgname=python-uncertainties
pkgver=2.4.7.1
pkgrel=1
pkgdesc="Transparent calculations with uncertainties on the quantities involved (aka 'error propagation'); fast calculation of derivatives"
arch=('any')
license=('BSD')
url="http://pythonhosted.org/uncertainties/"
depends=('python')
optdepends=('python-numpy: additional support for NumPy arrays and matrices')
makedepends=('python-setuptools')
source=(http://pypi.python.org/packages/source/u/uncertainties/uncertainties-${pkgver}.tar.gz)
md5sums=('e266ad2fba12799c6b7ff16841a7b83a')

build() {
  cd "${srcdir}/uncertainties-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/uncertainties-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
