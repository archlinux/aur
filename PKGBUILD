# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname='pyswisseph'
pkgver='2.00.00.2'
pkgrel='1'
pkgdesc='Python 2 extension to the Swiss Ephemeris'
arch=('i686' 'x86_64')
license=('GPL')
url=('http://astrorigin.ch/pyswisseph/')
depends=("python2")
source=("https://pypi.python.org/packages/source/p/pyswisseph/pyswisseph-2.00.00-2.tar.bz2")
md5sums=('b26e26f2c7e27b3e9d25fa0e082d7be8')

package() {
    cd $srcdir/$pkgname-2.00.00-2
    python2 setup.py install --root=$pkgdir || return 1
}
