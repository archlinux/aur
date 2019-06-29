# Maintainer: Your Name <linuxboy@fel.hopto.org>
pkgname=usbrelay
pkgver=20190629
pkgrel=1
pkgdesc="Control usb relay - based on hidapi"
url="https://github.com/darrylb123/usbrelay"
license=('GPL-2.0')
groups=('system')
depends=('hidapi')
arch=('i686' 'x86_64')
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
source=("https://github.com/darrylb123/usbrelay/archive/master.zip")
noextract=()
md5sums=('2291c1c5e92315d0d9e8804bfba4be6d')
validpgpkeys=()

prepare() {
	cd "$pkgname-master"
}

build() {
	cd "$pkgname-master"
	make
}


package() {
	cd "$pkgname-master"
	make DESTDIR="$pkgdir/" install
}
