# Maintainer: Martin C. Doege <mdoege at compuserve dot com>

_u_pkgrel=1
_u_pkgver=2.08.00
pkgname='pyswisseph'
pkgver="${_u_pkgver}.${_u_pkgrel}"
pkgrel='1'
pkgdesc='Python 2 extension to the Swiss Ephemeris'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/astrorigin/pyswisseph'
depends=("python2")
source=("https://pypi.python.org/packages/source/p/pyswisseph/pyswisseph-${_u_pkgver}-${_u_pkgrel}.tar.gz")

package() {
    cd "$srcdir/$pkgname-${_u_pkgver}-${_u_pkgrel}"
    python2 setup.py install --root="${pkgdir}" || return 1
}
md5sums=('9335e106f8dafb7093a1d75666f5b889')
