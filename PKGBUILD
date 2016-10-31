# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.4
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools')
install=tako.install
source=("https://takoshell.org/$pkgname-$pkgver.tar.gz")
sha256sums=('b9d36105e6756c948cb0b7cc70b171db717962eea07a22cfc1762485d3441912')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
