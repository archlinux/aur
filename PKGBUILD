# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
_pkgname='periodictable'
pkgver=1.6.1
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://periodictable.readthedocs.org"
arch=("any")
license=('public domain')
makedepends=('python-setuptools')
source=("https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('173c9857305a8b5557794be0a61d8d04')

package() {
    depends=('python-numpy' 'python-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
