# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.12.3
pkgrel=1
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/ca/c7/8d7e752f109276a13258e2ac1e45abfca0302435f407b69c9ffdb746c1a8/interutils-0.12.3.tar.gz")
sha256sums=('a898bc7398454f8ff967371c4665aa00c7e2e475e2fffc4103428edb7ff154ff')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

