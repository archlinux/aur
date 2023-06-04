# Maintainer: Amritpal Singh  - sysgrammer@protonmail.com
pkgname=perfmode
pkgver=3.4.0
pkgrel=14
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
    make 
}
package(){
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    DESTDIR="$pkgdir" make install
}
sha256sums=('f3b3bbd08ee3ef14e52f26393046f547deaa86ba309cb6e379cfe3297e7c08dc')
