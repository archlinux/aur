# Maintainer: Nabil Freij <nabil.freij@gmail.com>
pkgname=python2-glymur
pkgver=0.8.4
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
url="https://github.com/quintusdias/glymur"
depends=('python2' 'openjpeg')
makedepends=('python2')
license=('MIT')
arch=('any')
source=(https://pypi.io/packages/source/g/glymur/Glymur-$pkgver.tar.gz)
md5sums=('8185ffeb8d11d1f9c14f179b581e7d96')

build() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
