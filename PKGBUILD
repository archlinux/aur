# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=libtensorflow-cpu
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Assembled TenforFlow library for computation using data flow graphs on GPU."
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

source=("https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-gpu-linux-x86_64-${pkgver}.tar.gz")
md5sums=('2ff7693a0dbc205a41706f368a2e23d3')

validpgpkeys=()

package() {
    mkdir -p $pkgdir/usr
    cp -r include/ $pkgdir/usr/
    cp -r lib/ $pkgdir/usr/
    ln -s $pkgdir/usr/lib/libtensorflow.so $pkgdir/usr/lib/libtensorflow.so.$pkgver
}
