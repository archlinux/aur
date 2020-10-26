pkgname=polaric-connect
pkgver=0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Utility for connect Polaric web platform to raspberry"
license=('GPL')
url="https://www.polaricsemi.com"
makedepends=('git' 'make')
depends=('libssh' 'gtk3')
provides=('polaric-connect')
conflicts=('polaric-connect')
source=("git+https://github.com/NikitaLavrinenko/Polaric-Connect.git")
sha256sums=('SKIP')


build() {
    cd "Polaric-Connect"
    make
}

package() {
    cd "Polaric-Connect"
    make install DESTDIR="$pkgdir"
}
