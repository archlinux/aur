# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-socksipychain
pkgname=python2-socksipychain
_pkgname=python-SocksipyChain
pkgver=2.0.12
pkgrel=1
pkgdesc='A Python SOCKS/HTTP Proxy module'
arch=('any')
url='http://pagekite.org'
license=('BSD')
depends=('python2')
options=(!emptydirs)
source=("https://pagekite.net/pk/src/$_pkgname-$pkgver.tar.gz")
md5sums=('8ee8ff40e566aad9d76672a4ee745845')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
