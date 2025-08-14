pkgname=tatermark
pkgver=7.9.0
pkgrel=1
pkgdesc="A simple text editor, GNU Tatermark"
arch=('x86_64')
license=('GPL')
depends=('ncurses')
source=("https://raw.githubusercontent.com/flattmeplease/tatermark/main/main.cpp")
sha256sums=('SKIP')

build() {
  g++ -o t "$srcdir/main.cpp" -lncursesw
}

package() {
  install -Dm755 t "$pkgdir/usr/bin/t"
}
