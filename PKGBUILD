# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=ydiff
pkgver=1.1
pkgrel=1
pkgdesc="Colored, incremental, side-by-side diff viewer"
arch=('any')
url="http://pypi.python.org/pypi/ydiff/"
license=('BSD')
depends=('python')
conflicts=('cdiff')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('b8ef08b5fb5e77860922cbf96ad034a5')


package() {
   cd "$srcdir/$pkgname-$pkgver"

   python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
