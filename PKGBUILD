# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=minidwep-gtk
pkgver=40420
pkgrel=1
epoch=
pkgdesc="a wireless software"
arch=(x86_64)
url="https://sourceforge.net/projects/xiaopanos/files/Minidwep%2040420/"
license=('unknown')
groups=()
depends=(gksu
	reaver
	aircrack-ng lib32-libice lib32-libsm lib32-glibc lib32-glib2 lib32-libx11 pango glibc gdk-pixbuf2 freetype2
	bash gtk2 at-spi2-core fontconfig cairo glib2
	iw
)
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
source=("https://master.dl.sourceforge.net/project/xiaopanos/Minidwep%2040420/minidwep-gtk-40420-ubuntu-64bit.deb"
)
noextract=()
sha256sums=('1f6b8a6ccda409b6bb52a00b5ae5732a479f571e7f928e4847e5639f7b4a4f7d')
validpgpkeys=()

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
	chmod 644 $pkgdir/usr/local/lib/*
	echo "you may need to use sudo to launch this app"
}
