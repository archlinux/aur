pkgname=rasciit
pkgver=1.2.0
pkgrel=1
pkgdesc="Random ASCII typer"
arch=('x86_64')
url="https://thendsoft.su/rasciit.html"
license=('GPL')
depends=('gcc-libs')
makedepends=('gcc')
source=("rasciit.cpp")
sha256sums=('SKIP')

build() {
    g++ -std=c++17 -o rasciit rasciit.cpp
}

package() {
    install -Dm755 rasciit "$pkgdir/usr/bin/rasciit"
}
