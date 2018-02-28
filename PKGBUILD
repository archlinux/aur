# Maintainer: Anthony Samartsev <ant.samarcev@gmail.com>

pkgname=xcursor-pixelfun
pkgver=3.2
pkgrel=6
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="https://www.gnome-look.org/p/999913/"
license=('GPL')
source=(https://www.dropbox.com/s/k4gpt4dk57tlscu/168338-pixelfun3.tar.gz)
sha1sums=('d6c226831bfd11669a8ef18040d5b9cb4c0015a8')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r pixelfun3 $pkgdir/usr/share/icons
}
