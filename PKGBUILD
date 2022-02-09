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

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
sha256sums=('ebdf5fdcac069e31f4d896c716294865a85ded8f05184909378878cf8320c959')
