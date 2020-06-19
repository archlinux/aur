# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.11.1
pkgrel=1
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/aa/d6/be7a50a263cba7ad3bb88dd8d26194bc67fdebbdbd0e5f13761af870c97e/interutils-0.11.2.tar.gz")
sha256sums=('2f65243442d722489b4139cb662cbb755a18ca5878fe7df6703dbb83e21363da')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

