# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=xcursor-pixelfun
pkgver=3.2
pkgrel=1
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="http://gnome-look.org/content/show.php?content=168338"
license=('GPL')
source=(http://gnome-look.org/CONTENT/content-files/168338-pixelfun3.tar.gz)
sha1sums=('d6c226831bfd11669a8ef18040d5b9cb4c0015a8')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r pixelfun3 $pkgdir/usr/share/icons
}
