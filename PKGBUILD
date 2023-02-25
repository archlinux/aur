# Maintainer: Amritpal Singh  - sysgrammer@protonmail.com
pkgname=perfmode
pkgver=3.3.1
pkgrel=13
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
sha256sums=('edb9e23f06a161a7120f3e0c84c60c7273e39be9a4fe5da4d5d240924f956b7c')
