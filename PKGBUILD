#Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=python3-kitchen
pkgver=1.2.1
pkgrel=1
pkgdesc="Useful snippets of python code"
url="https://fedorahosted.org/kitchen"
depends=('python' )
makedepends=('python')
license=('LGPLv2+')
arch=('any')
source=(https://github.com/fedora-infra/kitchen/archive/$pkgver.tar.gz)
md5sums=('654de4eba96b8bbf30ec7bd213b67921')

build() {
    cd $srcdir/kitchen-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/kitchen-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
