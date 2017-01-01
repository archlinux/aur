# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.17
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools')
conflicts=('tako-git')
install=tako.install
source=("https://takoshell.org/takoshell-$pkgver.tar.gz")
sha256sums=('9ef387e6a119c8dbc73ab480496871d33dbde815c5e193882926acf66cf3fb75')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
