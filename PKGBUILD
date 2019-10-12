# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
_pkgname='periodictable'
pkgver=1.5.1
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://www.reflectometry.org/danse/elements.html"
arch=("any")
license=('public domain')
makedepends=('python-setuptools')
source=("https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('49065f497aa2d06781ebd70d5eed657a')

package() {
    depends=('python-numpy' 'python-pyparsing')
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
