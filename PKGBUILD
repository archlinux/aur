# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.0.15
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
sha256sums=('42a6666bdebc84b02843c4bedd4c9898a96da1932f42b218b81f16fb34c2bf15')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
