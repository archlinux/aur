# Maintainer: Sébastien LEBEAU <sebcbi1 at gmail dot com>

pkgname=transmission-remote-gtk
pkgver=1.1.1
pkgrel=1
pkgdesc="GTK remote control for the Transmission BitTorrent client"
url="https://code.google.com/p/transmission-remote-gtk/"
arch=(any)
license=(GPL2)
source=('https://transmission-remote-gtk.googlecode.com/files/transmission-remote-gtk-1.1.1.tar.gz')
sha1sums=('2fdfe0526a64a2ee5f24f1c31ca55771ea00ac7b')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
