# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=cdiff
pkgver=1.0
pkgrel=1
pkgdesc="Colored, incremental, side-by-side diff viewer"
arch=('any')
url="http://pypi.python.org/pypi/cdiff/"
license=('BSD')
depends=('python')
conflicts=('colordiff')
source=(https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c70ed1abbd9d999bfe4fd83e05ed4092')


package() {
   cd "$srcdir/$pkgname-$pkgver"

   python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
