# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=libtensorflow-cpu
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Assembled TenforFlow library for computation using data flow graphs on CPU."
arch=('i686' 'x86_64')
url="https://www.tensorflow.org"
license=('Apache-2.0')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('tensorflow' 'libtensorflow', 'libtensorflow-gpu')
replaces=()
backup=()
options=()
install=
changelog=

source=("https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-${pkgver}.tar.gz")
md5sums=('a1661a2bd8cf4b1bf0655ddce36aea51')

validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr
    cp -r include/ $pkgdir/usr/
    cp -r lib/ $pkgdir/usr/
    ln -s $pkgdir/usr/lib/libtensorflow.so $pkgdir/usr/lib/libtensorflow.so.$pkgver
}
