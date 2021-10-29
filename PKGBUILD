# Maintainer: Amritpal Singh sysgrammer@protonmail.com
pkgname=perfmode
pkgver=2.1.0
pkgrel=3
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
source=("https://github.com/icebarf/perfmode/archive/refs/tags/$pkgver.tar.gz")
build() {
    cd "$pkgname-$pkgver"
    make pkg
}
package(){
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir/usr/bin/" install
}
sha256sums=('c28c372ea486f7dcb72d30488e1a897252bec8866ea6d69f19be3acd3f1e9b28')
