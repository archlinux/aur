# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.10.1
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/58/e4/bf7d37c4b49ab30b01021cddcad878768feedc6db107e1f0f203ba4f1bf5/interutils-0.10.1.tar.gz")
sha256sums=('24db650eebe0cef1ce340e65c01d5ead8cd604933a1507411cf9cdf02c7b830f')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

