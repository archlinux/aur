# Maintainer: Joel Wejdenstål (acrimon) <joel.wejdenstal@gmail.com>

pkgname=nsh
pkgver=0.4.0
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
md5sums=('549cf6d358bc7623a1d81241c994e93d')
