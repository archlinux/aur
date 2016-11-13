# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.13
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools')
conflicts=('tako-git')
install=tako.install
source=("https://takoshell.org/$pkgname-$pkgver.tar.gz")
sha256sums=('e034932e96ef3ac2a57bf0c1e498c7f46c8d2aeaed1e49906cadcc5408c125e1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
