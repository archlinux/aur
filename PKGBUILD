# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=python-astroml
_pkgname=astroML
pkgver=0.3
pkgrel=1
pkgdesc="AstroML is a Python module for machine learning and data mining built on numpy, scipy, scikit-learn, and matplotlib."

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')
depends=('python-numpy' 'python-scipy' 'python-scikit-learn'
          'python-matplotlib')

optdepends=('astroml-examples')

source=("https://pypi.python.org/packages/source/a/astroML/astroML-${pkgver}.tar.gz")

md5sums=('56d5c281ca079eb569ef1898be1604db')


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr
}
