# Maintainer: Christian R. <chris-r@cronodevelopment.com>
pkgname=quill-editor
pkgver=0.1.4.2
pkgrel=1
pkgdesc="A simple CLI Text Editor"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
source=('editor.c' 'config.c')
sha256sums=('SKIP' 'SKIP')

build() {
    gcc -o "$srcdir/quill" "$srcdir/config.c" "$srcdir/editor.c" -lncurses
}

package() {
    install -Dm755 "$srcdir/quill" "$pkgdir/usr/bin/quill"
}
