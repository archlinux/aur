# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>
pkgname=('projectctr-makerom')
pkgver=0.17
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('i686' 'x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('unknown')
sha256sums=('SKIP')

_gitname=projectctr
source=("$_gitname::git+https://github.com/3DSGuy/Project_CTR.git#tag=makerom-v0.17")

build() {
    cd "$srcdir/$_gitname/makerom"
    make
}

package() {
    install -D "$srcdir/$_gitname/makerom/makerom" "$pkgdir/usr/bin/makerom"
}
