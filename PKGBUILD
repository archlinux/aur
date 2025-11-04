# Maintainer: Christian R. <chris-r@cronodevelopment.com>
pkgname=quill-editor
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple CLI Text Editor"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
source=('editor.cpp')
sha256sums=('SKIP')

build() {
    g++ "$srcdir/editor.cpp" -o "$srcdir/quill" -lncurses
}

package() {
    install -Dm755 "$srcdir/quill" "$pkgdir/usr/bin/quill"
}
