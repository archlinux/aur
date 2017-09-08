# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: sleduc <sebastien@sleduc.fr>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>

_name='babelfish'
pkgname=python-$_name
pkgver=0.5.5
pkgrel=2
pkgdesc="A module to work with countries and languages"
arch=('any')
url="http://pypi.python.org/pypi/${_name}"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/b/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('8380879fa51164ac54a3e393f83c4551a275f03617f54a99d70151358e444104')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
