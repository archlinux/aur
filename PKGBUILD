pkgname=goonsh
pkgver=1.0
pkgrel=1
pkgdesc="A simple custom shell (goonsh)"
arch=('x86_64')
license=('MIT')
depends=('readline')
makedepends=('gcc' 'make')
source=(goonsh.cpp)
b2sums=('SKIP')

build() {
  cd "$srcdir"
  g++ -O2 -o goonsh goonsh.cpp -lreadline
}

package() {
  install -Dm755 "$srcdir/goonsh" "$pkgdir/usr/bin/goonsh"
}
