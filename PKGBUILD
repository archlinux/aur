pkgname=helloworld
pkgver=1.0
pkgrel=1
pkgdesc="Colorful Tux penguin with configurable colors"
arch=('x86_64')
url="https://github.com/Nick-cpp/helloworld"
license=('GPL')
depends=('gcc-libs')
source=("helloworld.cpp")
md5sums=('SKIP')

build() {
    g++ -std=c++17 "$srcdir/helloworld.cpp" -o helloworld
}

package() {
    install -Dm755 helloworld "$pkgdir/usr/bin/helloworld"
}
