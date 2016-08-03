# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-socks
_pkgname=PySocks
pkgver=1.5.7
pkgrel=1
pkgdesc="SOCKS4, SOCKS5 or HTTP proxy (Anorov fork PySocks replaces socksipy)"
arch=('any')
license=('BSD')
url="https://github.com/Anorov/PySocks"
depends=('python2')
provides=('socksipy' 'python2-socksipy-branch')
conflicts=('socksipy' 'python2-socksipy-branch')
replaces=('python2-socksipy-branch')
source=("https://github.com/Anorov/PySocks/archive/$pkgver.tar.gz")
md5sums=('1d85fc1a5391711c04a16ff31fad1e8f')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
