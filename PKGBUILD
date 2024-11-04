# Maintainer: Sanzhar 04024004zh@gmail.com
pkgname=trex-c
pkgver=1.0
pkgrel=2
pkgdesc="A console game based on the Google T-Rex game"
arch=("x86_64")
url="https://github.com/StiveMan1/T-RexC"
license=("GNU")
depends=("glibc")
makedepends=("gcc")
source=("trex-c.c" "game_objects.h")
md5sums=("SKIP" "SKIP")

build() {
    cd "$srcdir"
    gcc -o "$pkgname" "$srcdir/trex-c.c" -lpthread -lm -O3
}

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
