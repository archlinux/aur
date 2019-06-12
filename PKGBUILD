# Maintainer: robertfoster

pkgname=python2-pyee
pkgver=6.0.0
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python"
arch=(any)
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python2')
source=("https://github.com/jfhbrook/pyee/archive/$pkgver.tar.gz")

package(){
    cd $srcdir/pyee-$pkgver
    echo "$pkgver-0-gad0107d" > version.txt
    python2 setup.py install --root="$pkgdir"
}

md5sums=('2fbd4749e7d264f8910d2a27074c9b3e')
