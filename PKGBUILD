# Maintainer: Len Share <dranukan at proton dot me>

pkgname='pyswisseph'
pkgver='2.10.3.2'
pkgrel=1
pkgdesc='Python extension to the Swiss Ephemeris.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/astrorigin/pyswisseph'
depends=('python')
conflicts=('pyswisseph3')

source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver%%.1}.tar.gz")
md5sums=('0d01b42ddf082f41000cf08a85ff18fe')

package() {
    cd "$srcdir/${pkgname}-${pkgver%%.1}"
    python setup.py install --root=$pkgdir || return 1
}

