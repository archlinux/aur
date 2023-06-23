
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=minidwep-gtk
pkgver=40420
pkgrel=1
pkgdesc="a wireless software"
arch=(x86_64)
url="https://sourceforge.net/projects/xiaopanos/files/Minidwep%2040420/"
license=('unknown')
depends=(gksu
	reaver
	aircrack-ng lib32-libice lib32-libsm lib32-glibc lib32-glib2 lib32-libx11 pango glibc gdk-pixbuf2 freetype2
	bash gtk2 at-spi2-core fontconfig cairo glib2
	iw
)
source=("https://master.dl.sourceforge.net/project/xiaopanos/Minidwep%2040420/minidwep-gtk-40420-ubuntu-64bit.deb"
)
sha256sums=('1f6b8a6ccda409b6bb52a00b5ae5732a479f571e7f928e4847e5639f7b4a4f7d')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
	chmod 644 $pkgdir/usr/local/lib/*
	echo "you may need to use sudo to launch this app"
}
