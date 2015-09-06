# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: sleduc <sebastien@sleduc.fr>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>

name='babelfish'
pkgname=python-$name
pkgver=0.5.4
pkgrel=1
pkgdesc="A module to work with countries and languages"
arch=('any')
url="http://pypi.python.org/pypi/$name"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/b/$name/$name-$pkgver.tar.gz")
md5sums=('49ef0bacc0886ffa2333bc85ca4b8799')

package() {
    cd "$srcdir/$name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
