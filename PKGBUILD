# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python2-debianbts
_pkgname=python-debianbts
_python=python2
pkgver=1.10
pkgrel=1
pkgdesc="Python interface to Debians Bug Tracking System"
arch=('any')
url="http://packages.debian.org/sid/python-debianbts"
license=('GPL2')
depends=('python2-soappy' 'python2-support')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('828d82eaa8884b51b29343c30de9458b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
