# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.12.0
pkgrel=1
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/80/c0/05d40b7539eb8fadf95c5488c625ec687827790d3b6d9b2e6798713f43a8/interutils-0.12.0.tar.gz")
sha256sums=('7f3605cdee0bab05e6b2b1842156535754100e2d5722f2e372b2b72cd442fa88')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

