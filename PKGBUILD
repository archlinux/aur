# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
_name='pylibconfig2'
pkgname=python-$_name
pkgver=0.2.5
pkgrel=1
pkgdesc="Pure python library for libconfig syntax"
arch=('any')
url="http://pypi.python.org/pypi/${_name}"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-pyparsing')
options=(!emptydirs)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('186bd2d88356036ac8770195c8a3e9bac3ccdb3b9e6ecf04be62c307760895c7')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
