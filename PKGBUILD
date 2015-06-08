# Maintainer: Jonne Haß <me@mrzyx.de>
pkgname=python-piwikapi
pkgver=0.3
pkgrel=1
pkgdesc="Python implementation of the Piwik tracking and the analytics API"
arch=('any')
url="http://piwikapi.readthedocs.org"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${pkgname/python-/}/${pkgname/python-/}-$pkgver.tar.gz")

package() {
  cd "$srcdir/${pkgname/python-/}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('cdd80c48450336911f28f0828167d7f7f33cc20e2f358d7160457c89432d37a5')
