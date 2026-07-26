pkgname=thereisnogame
pkgdesc="This is absolutely nothing. Really. Don't install this."
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
license=('GPL-3.0-or-later')
source=("thereisnogame.c")
sha256sums=('b425d1ca136dc3fa0d6944f974ed9168501ca9960d2834f15e7dc5b3ded69f43')

build() {
    gcc thereisnogame.c -o thereisnogame
}

package() {
    install -Dm755 thereisnogame "$pkgdir/usr/bin/thereisnogame"
}
