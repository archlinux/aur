# $Id$
# Maintainer: Shang Yuanchun <idealities@gmail.com>

pkgname=mirror
pkgdesc="rsync scheduler for open source mirror site"
pkgver=0.8.0
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/ideal/mirror"
depends=('rsync' 'python2-chardet')
source=(https://github.com/ideal/mirror/archive/$pkgver.tar.gz)
md5sums=('2d9ff65bce977332adcc47501d16f5c3')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root=$pkgdir
}
