# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.8.6
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/a6/1d/42065e5706f5b77401196d2da8916b5a01f9d415a82c389322909ddac07d/interutils-0.8.6.tar.gz")
sha256sums=('4892a37b6af68c5cc972c715564a003fcc5ca61e59befa8c302a0274a02fc3db')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

