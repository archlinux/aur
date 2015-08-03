# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=cdiff
pkgver=0.9.7
pkgrel=1
pkgdesc="Colored, incremental, side-by-side diff viewer"
arch=('any')
url="http://pypi.python.org/pypi/cdiff/"
license=('BSD')
depends=('python')
conflicts=('colordiff')
source=(http://pypi.python.org/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6e6e3dbbf0473ed091ef010f12d32134')


package() {
   cd "$srcdir/$pkgname-$pkgver"

   python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
