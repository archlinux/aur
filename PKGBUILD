pkgname=crmngr
pkgver=0.10.1
pkgrel=1
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python')
makedepends=('python-setuptools' )
license=('BSD')
arch=('any')
source=('https://pypi.python.org/packages/source/c/crmngr/crmngr-0.10.1.tar.gz')
md5sums=('0870e1ec92fca3388ebe20f2698addf5')

build() {
    cd $srcdir/crmngr-0.10.1
    python setup.py build
}

package() {
    cd $srcdir/crmngr-0.10.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
