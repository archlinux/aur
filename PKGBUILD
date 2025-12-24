pkgname=metal_time
pkgver=1.0.0
pkgrel=1
pkgdesc="A fun CLI tool to display the current time using toilet"
arch=('x86_64')
url="https://github.com/Cheezipie/metal_time"
license=('MIT')

depends=('toilet')
makedepends=('gcc')

source=("metal_time.cpp")
sha256sums=('SKIP')

build() {
    g++ -O2 -Wall -o metal_time metal_time.cpp
}

package() {
    install -Dm755 metal_time "$pkgdir/usr/bin/metal_time"
}
