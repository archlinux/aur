pkgname=pcmanfm-hardlinkcopy
pkgdesc="Add a custom action to PCManFM to perform hard link copies."
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
source=("hardlinkcopy.desktop")
md5sums=('SKIP')
depends=('zenity')

package() {
	mkdir -p $pkgdir/usr/share/file-manager/actions/
	cp hardlinkcopy.desktop $pkgdir/usr/share/file-manager/actions/
}