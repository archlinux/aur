# Maintainer: Nabil Freij <nabil.freij@gmail.com>
pkgname=python2-glymur
pkgver=0.8.18
_name=Glymur
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
url="https://github.com/quintusdias/glymur"
depends=('python2' 'openjpeg')
makedepends=('python2')
license=('MIT')
arch=('any')
conflicts=('')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('13f5da35b50ec2363292b059b8524629')

build() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/Glymur-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
