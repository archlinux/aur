# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>
_name='dogpile'
pkgname=python2-$_name
pkgver=0.2.2
pkgrel=1
pkgdesc="A 'dogpile' lock, typically used as a component of a larger caching solution"
arch=('any')
url='http://pypi.python.org/pypi/dogpile'
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/d/$_name/$_name-$pkgver.tar.gz")
md5sums=('4b854aea9f51614ef2179578048ace31')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
