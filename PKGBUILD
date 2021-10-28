# Maintainer: Amritpal Singh sysgrammer@protonmail.com
pkgname=perfmode
pkgver=1.1.0
pkgrel=2
pkgdesc="A fan-control utility for ASUS TUF Gaming series of Laptops"
arch=('x86_64')
url="https://github.com/icebarf/perfmode"
license=('GPL')
groups=()
depends=()
makedepends=('gcc')
optdepends=('faustus-dkms: A 3rd party kernel module for ASUS TUF Laptops')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/icebarf/perfmode")
build() {
    cd "$pkgname-$pkgver"
    make pkg
}
package(){
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir/usr/bin/" install
}
sha256sums=('79b5fe316ba9d5917307ccbd3d4db9dca7bb34c4f7b6127113b5a183a2d0fa55')
