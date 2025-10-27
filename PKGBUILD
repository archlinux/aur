pkgname=ratyper
pkgver=1.0.0
pkgrel=1
pkgdesc="Random ASCII typer"
arch=('x86_64')
url="https://thendsoft.su/ratyper.html"
license=('GPL')
depends=('gcc-libs')
makedepends=('gcc')
source=("ratyper.cpp")
sha256sums=('SKIP')

build() {
    g++ -std=c++17 -o ratyper ratyper.cpp
}

package() {
    install -Dm755 ratyper "$pkgdir/usr/bin/ratyper"
}
