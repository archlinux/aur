# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kcat-docs
_pkgname=kcat
pkgver=1.1
pkgrel=1
pkgdesc="Kachina 505DSP - Ham Radio Transceiver Control Program - DOCS"
arch=('any')
url="http://www.w1hkj.com"
license=('GPL')
optdepends=('kcat')
source=(http://downloads.sourceforge.net/project/fldigi/$_pkgname/$_pkgname-help.zip)

package() {
	cd $srcdir/$_pkgname-help

	mkdir -p $pkgdir/usr/share/doc/$_pkgname
	install -m644 *.* $pkgdir/usr/share/doc/$_pkgname

#	mkdir -p $pkgdir/usr/share/$_pkgname/doc
#	mv $pkgdir/usr/share/doc/$_pkgname/KCat_Users_Manual.pdf $pkgdir/usr/share/$_pkgname/doc/.
}
md5sums=('bab4c8473d996d0b45c1b6cf1147cb3a')
sha256sums=('277a662c57fe8fc155b53ed73f4e597f4cffd84c40877a0c47090c23b3d7f2a5')
