# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>

pkgname=python-sqlparse-0_3_0
_pkgname=python-sqlparse
pkgver=0.3.0
pkgrel=1
pkgdesc="A non-validating SQL parser module for Python"
url="https://github.com/andialbrecht/sqlparse"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=($_pkgname-$pkgver.zip::https://github.com/andialbrecht/sqlparse/archive/$pkgver.zip)
provides=('python-sqlparse')
conflicts=('python-sqlparse' 'pyton-sqlparse-git')
md5sums=('44e66ecc480fd4ac1309346c98e28e5b')

package() {
    cd "$srcdir/sqlparse-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$i_pkgname"
    cp LICENSE "$_/LICENSE"
}
