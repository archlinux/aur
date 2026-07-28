# Maintainer: Selby Mashiki mashikiselby@gmail.com
pkgname=arch-gf
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal girlfriend who judges your Arch Linux setup"
arch=("x86_64")
url="https://github.com/Kolgrim33/arch-gf"
license=("MIT")
depends=("gcc-libs")
makedepends=("gcc" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kolgrim33/$pkgname/archive/refs/heads/master.tar.gz")
sha256sums=("SKIP")

build() {
    cd "$srcdir/$pkgname-master"
    make
}

package() {
    cd "$srcdir/$pkgname-master"
    make install DESTDIR="$pkgdir"
}
