# Maintainer: Stefan Heinemann <stefan.heinemann@codedump.ch>

pkgname=pockyt
pkgver=1.3.1
pkgrel=1
pkgdesc="automate and manage your pocket collection"
url="https://github.com/arvindch/pockyt"
depends=('python' 'python-parse')
makedepends=('python' )
license=('GPLv3+')
arch=('any')
source=("https://github.com/arvindch/pockyt/archive/$pkgver.tar.gz")
md5sums=('1860cc8232b52a1cc52a0c4cbda7b2ad')


build() {
    cd $srcdir/pockyt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pockyt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
