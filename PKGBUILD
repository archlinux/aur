# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.3
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools')
install=tako.install
source=("https://takoshell.org/$pkgname-$pkgver.tar.gz")
sha256sums=('532f17893547617e3c96ffd1cc8aeafcc3262ad37fb897102b43a2c9bb71a63b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
