# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=python2-astroml
_pkgname=astroML
pkgver=0.3
pkgrel=1
pkgdesc="AstroML is a Python module for machine learning and data mining built on numpy, scipy, scikit-learn, and matplotlib."

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')
depends=('python2-numpy' 'python2-scipy' 'python2-scikit-learn'
          'python2-matplotlib')

optdepends=('astroml-examples')
conflicts=('python2-astroml-git')

source=("https://pypi.python.org/packages/source/a/astroML/astroML-${pkgver}.tar.gz")
md5sums=('56d5c281ca079eb569ef1898be1604db')


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
}
