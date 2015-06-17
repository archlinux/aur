# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=astroml-examples
_pkgname=astroML
pkgver=0.3
pkgrel=1
pkgdesc="AstroML is a Python module for machine learning and data mining built
on numpy, scipy, scikit-learn, and matplotlib. This package includes the
exmaples shipped with the astroML"

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')
depends=()

source=("https://pypi.python.org/packages/source/a/astroML/astroML-${pkgver}.tar.gz")

md5sums=('56d5c281ca079eb569ef1898be1604db')


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 ${pkgdir}/usr/share/astroML/examples/{algorithms,datasets,learning}
  install -D -m644 examples/algorithms/* \
    ${pkgdir}/usr/share/astroML/examples/algorithms
  install -D -m644 examples/datasets/* \
    ${pkgdir}/usr/share/astroML/examples/datasets
  install -D -m644 examples/learning/* \
    ${pkgdir}/usr/share/astroML/examples/learning
  install -D -m644 examples/README.rst ${pkgdir}/usr/share/astroML/examples

}
