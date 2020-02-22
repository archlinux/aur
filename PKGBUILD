# Maintainer: Dadoum <contact@dadoum.ml>
pkgname=checkra1n-ubuntu-bin
pkgver=0.9.8
pkgrel=1
pkgdesc="A community project to provide a high-quality semi-tethered jailbreak to all, based on the ‘checkm8’ bootrom exploit. "
arch=('x86_64')
url="https://checkra.in/"
license=('unknown')
groups=()
depends=('glibc>=2.24' 
	'ncurses5-compat-libs>=6.0' 
	'pango>=1.37.0'   
	'atk>=2.15.0' 
	'gdk-pixbuf2>=2.30.0' 
	'glib2>=2.45.0' 
	'fontconfig>=2.11.1' 
	'freetype2>=2.2.1' 
	'gtk3>=3.18.0' 
	'libusb>=1.0.19-2' 
	'libusbmuxd>=2.0.0-2' 
	'libplist>=2.1.0' 
	'libirecovery-git>=1.0.0' 
	'usbmuxd>=1.1.0')
makedepends=('tar' 'binutils')
checkdepends=()
optdepends=()
provides=('checkra1n')
conflicts=('checkra1n')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://assets.checkra.in/debian/checkra1n_0.9.8-2_amd64.deb")
noextract=('checkra1n_0.9.8-2_amd64.deb')
md5sums=('6ff4d19f2a31b54465951fd6f2efc94c')
validpgpkeys=()
options=('!strip')

prepare() {
	ar xf checkra1n_0.9.8-2_amd64.deb
	rm debian-binary control.tar.gz
}

check() {
	echo "eta son"
}

build() {
	echo "It is binary"
}

clean() {
	echo plz no clean
}

package() {
	mkdir -p $pkgdir
	tar xf data.tar.xz -C $pkgdir         
        rm data.tar.xz
}
