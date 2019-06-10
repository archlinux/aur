# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-socksipychain
pkgname=python2-socksipychain
_pkgname=SocksipyChain
pkgver=2.0.15b
pkgrel=1
pkgdesc='A Python SOCKS/HTTP Proxy module'
arch=('any')
url='http://pagekite.org'
license=('BSD')
depends=('python2' 'python2-setuptools')
options=(!emptydirs)
source=("https://pagekite.net/pk/src/$_pkgname-$pkgver.tar.gz")
sha256sums=('9b4125e85379b6573426df7ac02712026555ca1616d512fabb381c10764aa54b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
