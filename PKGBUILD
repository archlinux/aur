# Maintainer: Joel Wejdenstål (acrimon) <joel.wejdenstal@gmail.com>

pkgname=nsh
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal and fast shell."
arch=("x86_64")
url="https://gitlab.com/xacrimon/nsh"
license=('MIT')
makedepends=("make" "gcc" "musl")
source=("https://files.nebulanet.cc/nsh/release/$pkgname-v$pkgver.tar")

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    ./install.sh "$pkgdir"
}
md5sums=('efb55b7b7af8c4121bc32f607eb0527f')
