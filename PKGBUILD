# Maintainer: Amritpal Singh  - sysgrammer@protonmail.com
pkgname=perfmode
pkgver=3.2.5
pkgrel=9
pkgdesc="A fan-control utility for ASUS TUF Gaming series of Laptops"
arch=('x86_64')
url="https://github.com/icebarf/perfmode"
license=('GPL')
groups=()
depends=()
makedepends=('gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/icebarf/perfmode/archive/refs/tags/$pkgver.tar.gz")
build() {
    cd "$pkgname-$pkgver"
    make pkg
}
package(){
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/local/bin"
    make DESTDIR="$pkgdir/usr/local/bin/" install
}
sha256sums=('deb58899c84b426d8b9b079847a8d27dc8847b1e49d363a4f74847e10c36c5c7')
