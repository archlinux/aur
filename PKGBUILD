_orig=pyswisseph
pkgname='pyswisseph3'
pkgver='2.00.00.2'
pkgrel='2'
pkgdesc='Python extension to the Swiss Ephemeris. (Python 3 version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/astrorigin/pyswisseph'
depends=('python')
source=("http://pypi.python.org/packages/source/p/${_orig}/${_orig}-${pkgver%%.2}-${pkgver##*.}.tar.bz2")
md5sums=('b26e26f2c7e27b3e9d25fa0e082d7be8')

package() {
    cd "$srcdir/${_orig}-${pkgver%%.2}-${pkgver##*.}"
    python setup.py install --root=$pkgdir || return 1
}
