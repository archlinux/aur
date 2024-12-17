# Maintainer: Your Name <youremail@example.com>

pkgname=ncurseseditor
pkgver=1.0
pkgrel=1
pkgdesc="Простой редактор в терминале"
arch=('x86_64')
url="https://example.com/ncurseseditor"
license=('GPL')
depends=('ncurses')
source=("ncurseseditor.c")
sha256sums=('SKIP')  # Если исходный код не в архиве

build() {
    gcc -o $pkgname ncurseseditor.c -lncurses
}

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
