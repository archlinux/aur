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
sha256sums=('781106b3bc09e131c8eb01525fc4c5871f87504e7065cf55ade032d8c6400470')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
