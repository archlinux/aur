_orig=pyswisseph
pkgname='pyswisseph3'
pkgver='1.77.00'
pkgrel='1'
pkgdesc='Python extension to the Swiss Ephemeris. (Python 3 version)'
arch=('i686' 'x86_64')
license=('GPL')
url=('http://pyswisseph.chaosorigin.com/')
depends=('python')
#makedepends=()
#optdepends=()
source=("http://pypi.python.org/packages/source/p/${_orig}/${_orig}-${pkgver}-0.tar.bz2")
md5sums=('3ce9b9a013430d2d28f6c2f5a4f8a67f')

package() {
    cd "$srcdir/${_orig}-$pkgver-0"
    python setup.py install --root=$pkgdir || return 1
}
