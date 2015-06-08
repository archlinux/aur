# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=xcursor-pixelfun
pkgver=3.1
pkgrel=1
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="http://gnome-look.org/content/show.php?content=168338"
license=('GPL')
source=(http://gnome-look.org/CONTENT/content-files/168338-pixelfun3.tar.gz)
sha1sums=('5a25a31d291020f35b0ead92a2737652e505419b')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r pixelfun3 $pkgdir/usr/share/icons
}
