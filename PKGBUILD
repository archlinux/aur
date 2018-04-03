# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako
pkgver=0.2.5
pkgrel=2
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://takoshell.org/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
conflicts=('tako-git')
install=tako.install
source=("https://takoshell.org/releases/takoshell-$pkgver.tar.gz")
sha256sums=('23cbec63a10be3d6114ecbc17ad6a00083dcf6534944fb1881a8401be14872a3')

package() {
  cd "$srcdir/takoshell-$pkgver"
  python setup.py install --root=$pkgdir
}
