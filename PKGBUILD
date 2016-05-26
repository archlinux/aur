# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-periodictable'
pkgver=1.4.1
pkgrel=1
pkgdesc="Extensible periodic table of the elements"
url="http://www.reflectometry.org/danse/elements.html"
arch=("any")
license=('public domain')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pyparsing')
source=("https://github.com/pkienzle/periodictable/archive/v$pkgver.tar.gz")
md5sums=('c18a230824f135f82c75114d62d98b3a')

package() {
    cd "$srcdir/periodictable-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
    
