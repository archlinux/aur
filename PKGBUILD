# Maintainer: Amritpal Singh  - sysgrammer@protonmail.com
pkgname=perfmode
pkgver=3.5.1
pkgrel=1
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
    make 
}
package(){
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    DESTDIR="$pkgdir" make install
}
sha256sums=('c7b22b98871cc2f35cf3242c24b8d017b978e39c1031afc01ceaed8a61d1382d')
