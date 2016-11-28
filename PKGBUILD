# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=python2-cachetools
_pypiname=cachetools
pkgver=2.0.0
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
url="https://pypi.python.org/pypi/cachetools/1.0.0"
license=('MIT')
makedepends=('python2-pip')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.io/packages/source/c/cachetools/cachetools-${pkgver}.tar.gz")
sha256sums=('715a7202240dc20dbe83abdb2d804d543e2d4f07af146f53c82166bd75f3a628')


package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
