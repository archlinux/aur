pkgname=awesome-editor
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple text editor, GNU Awesome"
arch=('x86_64')
license=('GPL')
depends=('ncurses')
source=("main.cpp")
sha256sums=('SKIP')

build() {
  g++ -o awesome "$srcdir/main.cpp" -lncursesw
}

package() {
  install -Dm755 awesome "$pkgdir/usr/bin/awesome"
}