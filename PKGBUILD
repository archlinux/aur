# Maintainer: Benoît Giraudou <bgiraudou@gmail.com>
pkgname=gnome-epub-thumbnailer
pkgver=1.5
pkgrel=1
pkgdesc="Thumbnailer for EPub and MOBI books."
arch=('x86_64')
url="https://git.gnome.org/browse/gnome-epub-thumbnailer"
license=('GPL')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('308210f5800219f64cae4828e59bb8e6e4c53b888048cf487221aeb4337d791a')
 
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}
 
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
