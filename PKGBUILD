# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.8.7
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/3e/c6/775566819cdce6d2f4c553207257947acab8bb406f00e4f9154e4c818cf3/interutils-0.8.7.tar.gz")
sha256sums=('99a0b16631462b7f478b583647c50e7d46e6ce283d40c072343b80c70729e019')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

