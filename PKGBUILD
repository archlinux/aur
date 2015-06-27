# Maintainer: spider-mario <spidermario@free.fr>
pkgname=clonedigger
_pkgver=1.0.11-beta
pkgver=1.0.11beta
pkgrel=5
pkgdesc="Tool for finding clones in software written in Python."
arch=('any')
url="http://clonedigger.sourceforge.net/"
license=('GPL')
depends=('python2')
options=(!emptydirs !strip)
source=(http://pypi.python.org/packages/source/c/$pkgname/$pkgname-$_pkgver.tar.gz)
md5sums=(681a3e4693e941b89fbffb876b3e2790)

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
