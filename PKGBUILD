# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xf86bigfontproto
pkgver=1.2.0
pkgrel=1
pkgdesc="XF86BigFontProto protocol headers"
url='https://cgit.freedesktop.org/xorg/proto/xf86bigfontproto'
license=('MIT')
arch=('x86_64' 'i686')
source=("http://xorg.freedesktop.org/releases/individual/proto/xf86bigfontproto-$pkgver.tar.bz2")
sha256sums=('ba9220e2c4475f5ed2ddaa7287426b30089e4d29bd58d35fad57ba5ea43e1648')

build() {
	cd "$srcdir"/xf86bigfontproto-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/xf86bigfontproto-$pkgver
	make DESTDIR="$pkgdir" install
}
