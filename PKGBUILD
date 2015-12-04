pkgname=crmngr
pkgver=1.0.0
pkgrel=1
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python')
makedepends=('python-setuptools' )
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/c/crmngr/$pkgname-$pkgver.tar.gz")
md5sums=('fbe973f4969dba522c33c9b466a020cf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
