# Maintainer: Sibren Vasse <arch at sibrenvasse.nl>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>
_name='dogpile.core'
pkgname=python2-dogpile-core
pkgver=0.4.1
pkgrel=2
pkgdesc="A 'dogpile' lock, typically used as a component of a larger caching solution"
arch=('any')
url="http://pypi.python.org/pypi/dogpile.core"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2' 'python2-dogpile')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/d/$_name/$_name-$pkgver.tar.gz")
md5sums=('01cb19f52bba3e95c9b560f39341f045')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
