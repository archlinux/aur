# Contributor: Jesus Alvarez
# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=python-baker
pkgver=1.3
pkgrel=3
pkgdesc="Easy, powerful access to Python functions from the command line."
arch=('any')
url="https://bitbucket.org/mchaput/baker/wiki/Home"
license=('Apache License 2.0')
depends=('python')
source=("http://pypi.python.org/packages/source/B/Baker/Baker-${pkgver}.tar.gz")
md5sums=('e628d935accf915abf6cdef77b81d8d3')

package() {
  cd "$srcdir/Baker-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
