# Maintainer: Nabil Freij <nabil.freij@gmail.com>
pkgname=python2-glymur
pkgver=0.8.3
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
url="https://github.com/quintusdias/glymur"
depends=('python2' 'openjpeg')
makedepends=('python2')
license=('MIT')
arch=('any')
source=(https://pypi.python.org/packages/source/G/Glymur/Glymur-$pkgver.tar.gz)
md5sums=('2ff4c70a63a1e01f84b18e0ec4eb9b88')

build() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
