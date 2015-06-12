# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python-socks
_pkgname=PySocks
pkgver=1.5.0
pkgrel=1
pkgdesc="Routes sockets of any TCP service through a SOCKS4, SOCKS5 or HTTP proxy (Anorov fork PySocks replaces socksipy)"
arch=('any')
license=('BSD')
url="http://socksipy.sourceforge.net/"
depends=('python')
provides=('python-socksipy-branch')
conflicts=('python-socksipy-branch')
replaces=('python-socksipy-branch')
source=("https://github.com/Anorov/PySocks/archive/$pkgver.tar.gz")
md5sums=('e18e8ffd800a9b04c3ec3ccdfc4b71e5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

