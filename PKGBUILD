# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: sleduc <sebastien@sleduc.fr>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>

_name='babelfish'
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc="A module to work with countries and languages"
arch=('any')
url="https://pypi.python.org/pypi/${_name}"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/b/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('2dadfadd1b205ca5fa5dc9fa637f5b7933160a0418684c7c46a7a664033208a2')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
