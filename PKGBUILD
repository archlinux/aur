# Maintainer: xpt <user.xpt@gmail.com>

_name=emoji
pkgname=python2-$_name
pkgver=0.3.9
pkgrel=1
pkgdesc="Emoji for Python"
url="https://github.com/carpedm20/emoji/"
depends=('python2' )
license=('New BSD')
arch=('any')
source=("https://pypi.python.org/packages/1e/fa/e04ef9cc04a836094c1ddaf8bb96cf08adbc3394dee17b12190757d206bc/emoji-$pkgver.tar.gz")
md5sums=('382090c8820cdb16d85c1ebf3ec264f6')

build() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py build
}

package() {
    cd $srcdir/emoji-$pkgver
    python2.7 setup.py install --root="$pkgdir" --optimize=1 
}
