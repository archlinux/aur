pkgname=crmngr
pkgver=0.10.2
pkgrel=1
pkgdesc="crmngr is a tool to aid with the management of a r10k-style control repository."
url="https://github.com/vshn/crmngr"
depends=('python')
makedepends=('python-setuptools' )
license=('BSD')
arch=('any')
source=('https://pypi.python.org/packages/source/c/crmngr/crmngr-0.10.2.tar.gz')
md5sums=('7f3c8788b1456fcdc8f4d4ea23472401')

build() {
    cd $srcdir/crmngr-0.10.2
    python setup.py build
}

package() {
    cd $srcdir/crmngr-0.10.2
    python setup.py install --root="$pkgdir" --optimize=1 
}
