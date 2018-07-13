# Maintainer: sleduc <sebastien@sleduc.fr>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>

name='babelfish'
pkgname=python2-$name
pkgver=0.5.5
pkgrel=1
pkgdesc="A module to work with countries and languages"
arch=('any')
url="http://pypi.python.org/pypi/$name"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/b/$name/$name-$pkgver.tar.gz")
md5sums=('5f930555649692997bcf80bb5f42d9db')

package() {
  cd "$srcdir/$name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
