# Maintainer: Łukasz Magiera <me@magik6k.net>

pkgname=newns
pkgver=1.0
pkgrel=1
pkgdesc="A utility to spawn processes in new namespaces"
arch=('i686' 'x86_64')
url="http://web.mit.edu/luto/www/linux/nnp/newns.c"
license=('LGPL')
source=("http://web.mit.edu/luto/www/linux/nnp/newns.c")
md5sums=('b1e28e026185382d9aa14c296ffd748c')

build() {
        cd "$srcdir/"
        gcc newns.c -o newns
}

package() {
        mkdir -p $pkgdir/usr/bin
        cp newns $pkgdir/usr/bin/newns
}
