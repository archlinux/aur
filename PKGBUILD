# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>
pkgname=python-markdown2
pkgver=2.3.4
pkgrel=1
pkgdesc="A fast and complete implementation of Markdown in Python."
url="https://github.com/trentm/python-markdown2"
license=('MIT')
arch=('any')
depends=('python')
source=("https://github.com/trentm/python-markdown2/archive/${pkgver}.tar.gz")
md5sums=('99cd864d5184ecd5f486d68d8b3274d5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}
