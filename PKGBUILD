#Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=python3-kitchen
pkgver=1.2.4
pkgrel=2
pkgdesc="Useful snippets of python code"
url="https://github.com/fedora-infra/kitchen"
depends=('python' )
makedepends=('python')
license=('LGPLv2+')
arch=('any')
source=(https://github.com/fedora-infra/kitchen/archive/$pkgver.tar.gz)
md5sums=('300172a7400b590cd453fd84f4938d9b')

build() {
    cd $srcdir/kitchen-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/kitchen-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
