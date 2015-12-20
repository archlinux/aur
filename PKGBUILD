# Maintainer: Viliam Ganz <viliam.ganz@gmail.com>
pkgname=nvidia-xrun
pkgver=0.2
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
	install -Dm 644 nvidia-xorg.conf "$pkgdir/etc/X11/nvidia-xorg.conf"
	install -Dm 644 nvidia-xinitrc "$pkgdir/etc/X11/xinit/nvidia-xinitrc"
	install -Dm 755 nvidia-xrun "$pkgdir/usr/bin/nvidia-xrun"
	mkdir "$pkdgir/etc/X11/nvidia-xorg.conf.d"
}
md5sums=('5ea15f551e85f6a4adeefa22250d8b42')
