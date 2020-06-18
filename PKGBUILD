# Maintainer: Max G <max3227@gmail.com>

pkgname=python-interutils
_pypiname=${pkgname/python-/}
pkgver=0.10.2
pkgrel=1
pkgdesc="A collection of handy utilities and snippets for creating interactive programs"
arch=('any')
url='https://pypi.org/project/interutils/'
license=('MIT')
depends=('python-setuptools' 'python-termcolor')

source=("https://files.pythonhosted.org/packages/90/29/35e7342751a5292db7588c65f4a4b371affb79f9c9ab7f34874c6063f0bf/interutils-0.10.2.tar.gz")
sha256sums=('82aff195f8c41c582b00abb1a1223cda2c5aff9845c8cfda45aa3ff4cd3a3ee3')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

