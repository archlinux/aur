# Maintainer: Philipp Schmitt <philipp@schmitt.co>
pkgname=python2-pagekite
_pkgname=pagekite
pkgver=0.5.6d
pkgrel=1
pkgdesc='Python implementation of the PageKite remote front-end protocols.'
arch=('any')
url='http://pagekite.org'
license=('GPL')
depends=('python')
provides=('pypagekite')
conflicts=('pagekite')
options=(!emptydirs)
source=("https://pagekite.net/pk/src/$_pkgname-$pkgver.tar.gz")
md5sums=('2e1982c3fc9dc9461e7b1e24ffffe468')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
