# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python2-python-meteor
pkgver=0.1.6
pkgrel=1
pkgdesc="An event driven meteor client"
url="https://github.com/hharnisc/python-meteor"
depends=('python2' 'python2-python-ddp')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/python-meteor/python-meteor-$pkgver.tar.gz")
md5sums=('a3aa0993f07fd941adddc44b91438ab8')

build() {
    cd "$srcdir/python-meteor-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-meteor-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
