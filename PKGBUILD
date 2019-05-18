# Maintainer: Nabil Freij <nabil.freij@gmail.com>
pkgname=python-glymur
pkgver=0.8.18
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
url="https://github.com/quintusdias/glymur"
depends=('python' 'openjpeg')
makedepends=('python')
license=('MIT')
arch=('any')
conflicts=('')
source=(https://pypi.python.org/packages/1a/a6/4cf6ffa0b999b2b413c0d13182d59f3e5e21ee1e1b4217ef8c7c2eb8cb33/Glymur-$pkgver.tar.gz)
md5sums=('13f5da35b50ec2363292b059b8524629')

build() {
    cd $srcdir/Glymur-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/Glymur-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
