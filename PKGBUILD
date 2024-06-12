# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
_pkgname='periodictable'
pkgver=1.7.0
pkgrel=2
pkgdesc="Extensible periodic table of the elements"
url="http://periodictable.readthedocs.org"
arch=("any")
license=('public domain')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('54c58bb8e591a6f9c80b43465fb283f0')

package() {
    depends=('python' 'python-numpy' 'python-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
