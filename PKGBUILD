# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=xcursor-pixelfun
pkgver=3.2
pkgrel=3
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="https://www.gnome-look.org/p/999913/"
license=('GPL')
source=(https://dl.opendesktop.org/api/files/download/id/1461762510/168338-pixelfun3.tar.gz)
sha1sums=('d6c226831bfd11669a8ef18040d5b9cb4c0015a8')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r pixelfun3 $pkgdir/usr/share/icons
}
