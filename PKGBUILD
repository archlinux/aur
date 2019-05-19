# Maintainer: higgsbosoncodes higgsbosoncodes@gmail.com
# https://github.com/higgsbosoncodes
pkgname=arch-animated-startscreen
pkgver=1.8.2
pkgrel=1
epoch=
pkgdesc="Animated SDDM-Theme and Splashscreen for Archlinux (made for KDE)(Aurora Borealis Background)"
arch=("any")
url="https://github.com/higgsbosoncodes/Arch-Aurora-Borealis-Startscreen.git"
license=('GPL3')
groups=()
depends=('qt5-multimedia>=5.12.1' 'qt5-quickcontrols>=5.12.1')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/higgsbosoncodes/Arch-Aurora-Borealis-Startscreen/archive/master.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    export LD_PRELOAD='/usr/lib/libfakeroot/libfakeroot.so'
	cd "Arch-Aurora-Borealis-Startscreen-master"
	make
}

check() {
	cd "Arch-Aurora-Borealis-Startscreen-master"
	make -k check
}

package() {
    export LD_PRELOAD='/usr/lib/libfakeroot/libfakeroot.so'
	cd "Arch-Aurora-Borealis-Startscreen-master"
	make DESTDIR="$pkgdir/" install
}
