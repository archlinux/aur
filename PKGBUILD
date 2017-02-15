# Maintainer: Thomas Haider <t.haider@deprecate.de>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python2-authres
_pkgname=authentication-results-python
pkgver=0.900
pkgrel=1
pkgdesc="Python2 Authentication-Results Headers generation and parsing"
arch=('any')
url="http://launchpad.net/authentication-results-python"
license=('Apache')
depends=('python2')
conflicts=('python-authres')
source=("https://launchpad.net/$_pkgname/$pkgver/$pkgver/+download/authres-$pkgver.tar.gz")
sha256sums=('de91d6cc6e5c6fef545bbf0a810a765fab4ca162906d14f3f2a6b9858602c186')

build() {
  cd "$srcdir/authres-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/authres-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

