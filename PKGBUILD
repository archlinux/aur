# Maintainer: Thomas Haider <t.haider@deprecate.de>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python2-authres
_pkgname=authentication-results-python
pkgver=0.800
pkgrel=1
pkgdesc="Python2 Authentication-Results Headers generation and parsing"
arch=('any')
url="http://launchpad.net/authentication-results-python"
license=('Apache')
depends=('python2')
conflicts=('python-authres')
source=(http://launchpad.net/$_pkgname/$pkgver/0.8/+download/authres-$pkgver.tar.gz)
 
build() {
  cd "$srcdir/authres-$pkgver"
  python2 setup.py build 
}

package() {
  cd "$srcdir/authres-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}

sha256sums=('d28e3976a7d418917cbbf384018aa0e8a0489e41bfd9847309c5f8efb19f6efd')
