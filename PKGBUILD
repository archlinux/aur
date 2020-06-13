# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.8.4
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/1e/17/22921c170e7a89785d6f90f506be91386ea7e16af8d2da65c34001b5e55a/interutils-0.8.4.tar.gz")
sha256sums=('84ca4d799e62bc094c53432c6092a95b5146a67df8b0a4245c72312a31c12fbe')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

