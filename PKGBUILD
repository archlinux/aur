# Maintainer: Stefan Heinemann <stefan.heinemann@codedump.ch>

pkgname=pockyt
pkgver=1.0
pkgrel=1
pkgdesc="automate and manage your pocket collection"
url="https://github.com/arvindch/pockyt"
depends=('python' )
makedepends=('python3' )
license=('GPLv3+')
arch=('any')
source=('https://pypi.python.org/packages/1a/e0/a47f82100e5035bb9b22b952cd699706101e815cae01788ea6d533849641/pockyt-1.0.zip')
md5sums=('b714f28e3a4fa5a536a45586ee73b11d')

build() {
    cd $srcdir/pockyt-1.0
    python setup.py build
}

package() {
    cd $srcdir/pockyt-1.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
