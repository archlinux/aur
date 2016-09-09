# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=xcursor-osx-elcap
pkgver=1.00
pkgrel=1
pkgdesc="Cursor theme from OSX"
arch=('any')
url="https://www.gnome-look.org/p/1084939/"
license=('GPL')
source=(https://dl.opendesktop.org/api/files/download/id/1461053384/175749-OSX-ElCap.tar.bz2)
sha1sums=('0fb7f2be4f1f1effc3b962aff12793fbea863a93')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r OSX-ElCap/OSX-ElCap $pkgdir/usr/share/icons
}
