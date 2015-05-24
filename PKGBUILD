# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=cdiff
pkgver=0.9.6
pkgrel=1
pkgdesc="Colored, incremental, side-by-side diff viewer"
arch=('any')
url="http://pypi.python.org/pypi/cdiff/"
license=('BSD')
depends=('python')
conflicts=('colordiff')
source=(http://pypi.python.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e71be83591535621b5c11504563d859b')


package() {
   cd "$srcdir/$pkgname-$pkgver"

   python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
