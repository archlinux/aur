# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
pkgname=zbase32
pkgver=1.1.5
pkgrel=2
pkgdesc="An alternate base32 encoder (not RFC 3548 compliant)"
arch=('any')
url='https://pypi.python.org/pypi/zbase32'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/z/zbase32/zbase32-${pkgver}.tar.gz")
md5sums=('4dba0be4ac6d66968de8e5173f51d65d')

build() {
    cd "$srcdir/zbase32-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/zbase32-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
