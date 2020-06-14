# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.8.8
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/93/87/f3585cf7d487a8a57a1eaef2b56d54137d71ffd91be8ad39286f3f48bbee/interutils-0.8.8.tar.gz")
sha256sums=('e9c8822823beeeec77a1eadcce5e7ddcdfdd845122bff045c5107d9cc9b2b90b')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

