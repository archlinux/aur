# Maintainer: Joel Wejdenstål (acrimon) <joel.wejdenstal@gmail.com>

pkgname=nsh
pkgver=0.5.0
pkgrel=1
pkgdesc="A minimal and fast shell."
arch=("x86_64")
url="https://gitlab.com/xacrimon/nsh"
license=('MIT')
depends=("glibc" "gcc-libs")
makedepends=("make" "rust")
source=("https://files.nebulanet.cc/nsh/release/$pkgname-v$pkgver.tar")

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    ./install.sh "$pkgdir"
}
md5sums=('fe5db4c1f32096e7373657d7056dc048')
