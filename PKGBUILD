# Maintainer: qlonik <volodin.n at gmail dot com>

pkgname=python-python-ddp
pkgver=0.1.5
pkgrel=1
pkgdesc="An event driven ddp client"
url="https://github.com/hharnisc/python-ddp"
depends=('python' 'python-pyee' 'python-ws4py' 'python-meteor-ejson')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/python-ddp/python-ddp-$pkgver.tar.gz")
md5sums=('df80774a52f84258154c9371b6acf48d')

build() {
    cd "$srcdir/python-ddp-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/python-ddp-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
