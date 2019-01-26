# Maintainer: Joel Wejdenstål (acrimon) <joel.wejdenstal@gmail.com>

pkgname=nsh
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimal and fast shell."
arch=("x86_64")
url="https://gitlab.com/xacrimon/nsh"
license=('MIT')
depends=("glibc")
makedepends=("make" "gcc")
source=("https://files.nebulanet.cc/nsh/release/$pkgname-v$pkgver.tar")

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    ./install.sh "$pkgdir"
}
md5sums=('672f879232b49305e1458f71ff8b7001')
