# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=biblereader
pkgver=1.0.5
pkgrel=1
pkgdesc="GTK Frontend for libbible"
arch=('x86_64')
url="https://vance.fish/git/biblereader/"
license=('GPL')
depends=(gtkmm 'libbible>=1.0.1')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
