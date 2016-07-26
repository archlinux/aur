# Maintainer: Daniel Fernandez Rodriguez <gmail.com daferoes>
pkgname=python-cec
pkgver=0.2.5
pkgrel=1
pkgdesc="libcec bindings for Python"
arch=('any')
url="https://github.com/trainman419/python-cec"
license=('GPL')
depends=('libcec>=1.6.1')
makedepends=('git' 'python2-setuptools')
source=("https://github.com/trainman419/python-cec/archive/$pkgver.tar.gz")
md5sums=('f086f0f853fbfa5d241ab53c89ea50bf')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir"
}
