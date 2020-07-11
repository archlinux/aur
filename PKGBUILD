# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.12.4
pkgrel=2
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/source/i/interutils/interutils-0.12.4.tar.gz")
sha256sums=("e6088c1d04093cfe1986478e3576a154bc41f4bd2c081f0c626a8fcc170d5080")

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

