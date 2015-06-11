# Maintainer: Viliam Ganz <viliam.ganz@gmail.com>
pkgname=nvidia-xrun
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Script to run dedicated X server with discrete nvidia graphics"
arch=("x86_64")
url="https://github.com/Witko/nvidia-xrun"
license=('GPL')
groups=()
depends=('xorg-server' 'xorg-xinit' 'xorg-xrandr' 'nvidia' 'mesa-libgl' 'bbswitch')
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
source=("https://github.com/Witko/nvidia-xrun/archive/$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/etc/X11/"
	mkdir -p "$pkgdir/etc/X11/xinit"
	mkdir -p "$pkgdir/etc/X11/nvidia.xorg.config.d"
	cp nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	cp nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	mkdir "$pkgdir/bin"
        cp nvidia-xrun "$pkgdir/bin/nvidia-xrun"
}
md5sums=('96ee491905ff47e8cd35e9e0fddcd502')
