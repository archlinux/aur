pkgname=ojcat
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight ELF file inspection tool written in C"
arch=('x86_64')
url="https://github.com/ABO7GAG/ojcat"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ABO7GAG/ojcat/archive/refs/tags/V1.0.tar.gz")
sha256sums=('3fa2fcc9544abaf8c1cda63b98018a6c33db7cd621539ce070e596bc8fa9cc1a')

build() {
    cd "$srcdir/$pkgname-1.0"
    make
}

package() {
    cd "$srcdir/$pkgname-1.0"
    install -Dm755 ojcat "$pkgdir/usr/bin/ojcat"
}
