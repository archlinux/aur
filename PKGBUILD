# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-socks
_pkgname=PySocks
pkgver=1.6.5
pkgrel=1
pkgdesc="SOCKS4, SOCKS5 or HTTP proxy (Anorov fork PySocks replaces socksipy)"
arch=('any')
license=('BSD')
url="https://github.com/Anorov/PySocks"
depends=('python')
provides=('python-socksipy-branch')
conflicts=('python-socksipy-branch')
replaces=('python-socksipy-branch')
source=("https://github.com/Anorov/PySocks/archive/$pkgver.tar.gz")
md5sums=('2012790b3793457a8c604fceb9842421')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
