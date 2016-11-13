# Maintainer: Nabil Freij <nabil.freij@gmail.com>
pkgname=python2-glymur
pkgver=0.8.7
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
url="https://github.com/quintusdias/glymur"
depends=('python2' 'openjpeg')
makedepends=('python2')
license=('MIT')
arch=('any')
source=(https://pypi.python.org/packages/1a/a6/4cf6ffa0b999b2b413c0d13182d59f3e5e21ee1e1b4217ef8c7c2eb8cb33/Glymur-$pkgver.tar.gz)
md5sums=('727154aa21e4744cb9115546d3690541')

build() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
