pkgname=atyper
pkgver=1.0.0
pkgrel=1
pkgdesc="Named ASCII art display utility"
arch=('x86_64')
url="https://github.com/Nick-cpp/atyper"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
source=(atyper.cpp)
sha256sums=('SKIP')

build() {
  g++ atyper.cpp -o atyper
}

package() {
  install -Dm755 atyper "$pkgdir/usr/bin/atyper"
}
