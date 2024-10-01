# Maintainer: aquova <mail at aquova dot net>
pkgname="cdirip"
pkgver=0.6.4
pkgrel=1
pkgdesc="CDI extraction tool"
url="https://github.com/jozip/cdirip"
arch=("x86_64")
license=("GPL2")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e9daad29eec25079be35474c39ebffeb3f2967adf1538c84562358449a0729b6")

build() {
    cd $srcdir/${pkgname}-${pkgver}
    make -f Makefile.linux
}

package() {
    install -Dm755 $srcdir/${pkgname}-${pkgver}/cdirip $pkgdir/usr/bin/cdirip
}
