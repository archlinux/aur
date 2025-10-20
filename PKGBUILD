pkgname=canpass
pkgver=1.0
pkgrel=1
pkgdesc="Cool console password manager for your linux system!"
arch=('x86_64')
url="https://thendsoft.su/canpass.html"
license=('GPL')
depends=('gcc-libs')
source=("canpass.cpp")
md5sums=('SKIP')

build() {
    g++ -std=c++17 "$srcdir/canpass.cpp" -o canpass
}

package() {
    install -Dm755 canpass "$pkgdir/usr/bin/canpass"
}
