# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Quentin Stievenart <acieroid@awesom.eu>
name='dogpile.cache'
pkgname=python2-dogpile-cache
pkgver=0.5.7
pkgrel=1
pkgdesc="A caching front-end based on the Dogpile lock."
arch=('any')
url="http://pypi.python.org/pypi/dogpile.cache"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2' 'python2-dogpile')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/d/$name/$name-$pkgver.tar.gz")
md5sums=('3e58ce41af574aab41d78e9c4190f194')

package() {
  cd "$srcdir/$name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
