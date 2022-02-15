# Maintainer: laserK300030003000 <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=mesaflash
pkgver=3.4.2
pkgrel=1
epoch=
pkgdesc="configuration and diagnostic tool for Mesa Electronics PCI(E)/ETH/EPP/USB/SPI boards"
arch=('i686' 'x86_64')
url="https://github.com/LinuxCNC/mesaflash"
license=('GPL')
groups=()
depends=('libmd' 'pciutils')
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
source=("https://github.com/LinuxCNC/$pkgname/archive/refs/tags/release/$pkgver.tar.gz")
noextract=()
md5sums=('0b5d230bd901049fd9db500508329cd1')
validpgpkeys=()

build() {
	cd "$pkgname-release-$pkgver"
	make
}

package() {
	cd "$pkgname-release-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}
