# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=joshuto-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
url="https://github.com/kamiyaa/joshuto"
license=("LGPL3")
arch=("x86_64")
depends=("gcc-libs" "glibc")
provides=("joshuto")
conflicts=("joshuto" "joshuto-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('012d98ebc8d7e6ed3df074294d4794cc3e538c81d26353e54b357add69a359260420087e2dbf7d3cb72b32f63f1cd864cc599374c4b2f14f9e5c04b3863a58f1')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/joshuto-v$pkgver-x86_64-unknown-linux-gnu/joshuto"
}
