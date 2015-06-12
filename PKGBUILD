# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-socks
_pkgname=PySocks
pkgver=1.5.0
pkgrel=1
pkgdesc="Routes sockets of any TCP service through a SOCKS4, SOCKS5 or HTTP proxy (Anorov fork PySocks replaces socksipy)"
arch=('any')
license=('BSD')
url="http://socksipy.sourceforge.net/"
depends=('python2')
provides=('socksipy' 'python2-socksipy-branch')
conflicts=('socksipy' 'python2-socksipy-branch')
replaces=('python2-socksipy-branch')
source=("https://github.com/Anorov/PySocks/archive/$pkgver.tar.gz")
md5sums=('e18e8ffd800a9b04c3ec3ccdfc4b71e5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

