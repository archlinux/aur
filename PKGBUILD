# Maintainer: spider-mario <spidermario@free.fr>
pkgname=clonedigger
pkgver=1.1.0
pkgrel=1
pkgdesc="Tool for finding clones in software written in Python."
arch=('any')
url="http://clonedigger.sourceforge.net/"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs !strip)
source=(https://pypi.python.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0bf30b2de988f15d4dd57fd78e1e302f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
