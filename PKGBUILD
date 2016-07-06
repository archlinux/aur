# Maintainer:   Salamandar <felix@piedallu.me>

pkgname=rust-book-git
pkgver=20160706
pkgrel=1
pkgdesc="An offline version of rust-lang.github.io/book, the official documentation for the Rust language (git already compiled version)"
arch=('any')
url="https://doc.rust-lang.org/book/"
license=('MIT')

source=("git+https://github.com/rust-lang/book#branch=gh-pages")
sha256sums=('SKIP')

package() {
    cd "$srcdir/book"
    mkdir -p ${pkgdir}/usr/share/doc/rust/book
    cp -R * "${pkgdir}/usr/share/doc/rust/book/"
}
