# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=python2-cachetools
_pypiname=cachetools
pkgver=1.0.0
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
url="https://pypi.python.org/pypi/cachetools/1.0.0"
license=('MIT')
makedepends=('python2-pip')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${_pypiname}/${_pypiname}-$pkgver.tar.gz)
md5sums=('bc7addc2b29a18f6ff7f3c4a7071c41e')


package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
