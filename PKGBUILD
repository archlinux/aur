# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=rust-src
pkgver=1.15.0
pkgrel=2
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz")
sha256sums=('f655e4fac9c2abb93eb579e29c408e46052c0e74b7655cd222c63c6743457673')

package() {
    cd "rustc-$pkgver-src"
    mkdir -p "$pkgdir/usr/src/rust/"
    cp -r * "$pkgdir/usr/src/rust/"
}
