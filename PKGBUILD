# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
_pkgname='periodictable'
pkgver=1.7.1
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://periodictable.readthedocs.org"
arch=("any")
license=('public domain')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('e1a246ef913d841d1deb106c9ba63894')

package() {
    depends=('python' 'python-matplotlib' 'python-numpy' 'python-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
