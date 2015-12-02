pkgname=crmngr
pkgver=0.10.3
pkgrel=1
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python')
makedepends=('python-setuptools' )
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/c/crmngr/$pkgname-$pkgver.tar.gz")
md5sums=('d6d6fd62b4c328caff0edf872f30a51a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
