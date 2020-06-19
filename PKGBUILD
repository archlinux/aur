# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.12.1
pkgrel=1
pkgdesc="A collection of utilities for creating interactive console scripts"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/79/e7/b2171ac8f06630a4940b2b6edddd84b8568820e738266d4c6ffd7f79b797/interutils-0.12.1.tar.gz")
sha256sums=('a9916e078932b961ee8fb9307efe59c597a8b0fe7893b0bdc7998a585848d8db')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

