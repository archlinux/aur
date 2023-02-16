# Maintainer: Amritpal Singh  - sysgrammer@protonmail.com
pkgname=perfmode
pkgver=3.2.6
pkgrel=11
pkgdesc="A fan-control utility for ASUS TUF Gaming series of Laptops"
arch=('x86_64')
url="https://github.com/rdseed/perfmode"
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
source=("https://github.com/rdseed/perfmode/archive/refs/tags/$pkgver.tar.gz")
build() {
    cd "$pkgname-$pkgver"
    make pkg
}
package(){
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/local/bin"
    make DESTDIR="$pkgdir/usr/local/bin/" install
}
sha256sums=('50cc67c6a0baaf116b5f74fe5a4178342f7109fc9e01ec6aa2e85e415a7f753f')
