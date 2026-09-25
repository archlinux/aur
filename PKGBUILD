pkgname=ojcat
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight ELF file inspection tool written in C"
arch=('x86_64')
url="https://github.com/ABO7GAG/ojcat"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ABO7GAG/ojcat/archive/refs/tags/V1.0.1.tar.gz")
sha256sums=('6ce573d8af189ec7e9bb9f895e5189ecdda545ec2cf47db56ac993646321c5ee')

build() {
    cd "$srcdir/$pkgname-1.0.1"
    make
}

package() {
    cd "$srcdir/$pkgname-1.0.1"
    install -Dm755 ojcat "$pkgdir/usr/bin/ojcat"
}
