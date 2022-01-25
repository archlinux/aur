# Maintainer: Amritpal Singh  - sysgrammer@protonmail.com
pkgname=perfmode
pkgver=3.2.4
pkgrel=8
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
    mkdir -p "$pkgdir/usr/local/bin"
    make DESTDIR="$pkgdir/usr/local/bin/" install
}
sha256sums=('4dad80160146fd6f58ee1e28f674bf46edbd5fd65ef33b5bc209540bb5ed9c05')
