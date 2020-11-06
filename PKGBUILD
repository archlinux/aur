# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
_pkgname='periodictable'
pkgver=1.5.3
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://periodictable.readthedocs.org"
arch=("any")
license=('public domain')
makedepends=('python-setuptools')
source=("https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('bb25c2c4e31855cb4b68df876366e558')

package() {
    depends=('python-numpy' 'python-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
