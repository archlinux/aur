_orig=pyswisseph
pkgname='pyswisseph3'
pkgver='2.08.00.1'
pkgrel=1
pkgdesc='Python extension to the Swiss Ephemeris. (Python 3 version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/astrorigin/pyswisseph'
depends=('python')
source=("https://pypi.python.org/packages/source/p/${_orig}/${_orig}-${pkgver%%.1}-${pkgver##*.}.tar.gz")

package() {
    cd "$srcdir/${_orig}-${pkgver%%.1}-${pkgver##*.}"
    python setup.py install --root=$pkgdir || return 1
}
md5sums=('9335e106f8dafb7093a1d75666f5b889')
