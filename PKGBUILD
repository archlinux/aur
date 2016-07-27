# Maintainer: NextHendrix <cjones12@sheffield.ac.uk>

pkgname=vmg
pkgver=3.5
pkgrel=2
pkgdesc="Handy virtual magnifying glass tool"
arch=('i686' 'x86_64')
url="http://magnifier.sourceforge.net/"
license=('GPL2')
depends=('lib32-gtk2')
conflicts=('vmg-svn')
source=("http://sourceforge.net/projects/magnifier/files/magnifier%20for%20Linux/3.5/magnifier-linux-3.5.tar.bz2"
	"vmg.desktop")
md5sums=('8302710ad565f1f1de63cf307703f6f5'
         'e831d6b702672283d3c64202454c6f32')

package() {
	mkdir -p $pkgdir/usr/share/applications
	cp ./vmg.desktop $pkgdir/usr/share/applications/
	cd "magnifier-linux-3.5"
	mkdir -p $pkgdir/usr/share/magnifier
	cp ./topleft.bmp $pkgdir/usr/share/magnifier/
	cp ./topright.bmp $pkgdir/usr/share/magnifier/
	cp ./bottomleft.bmp $pkgdir/usr/share/magnifier/
	cp ./bottomright.bmp $pkgdir/usr/share/magnifier/
	cp ./top.bmp $pkgdir/usr/share/magnifier/
	cp ./left.bmp $pkgdir/usr/share/magnifier/
	cp ./bottom.bmp $pkgdir/usr/share/magnifier/
	cp ./right.bmp $pkgdir/usr/share/magnifier/
	cp ./icon3.ico $pkgdir/usr/share/magnifier/
	cp ./icon3.png $pkgdir/usr/share/magnifier/
	cp ./cecae.bmp $pkgdir/usr/share/magnifier/
	cp ./feusp.bmp $pkgdir/usr/share/magnifier/
	cp ./vmg.bmp $pkgdir/usr/share/magnifier/
	cp ./lupa.bmp $pkgdir/usr/share/magnifier/
	cp ./usplegal.bmp $pkgdir/usr/share/magnifier/
	cp ./docs/README-EN.pdf $pkgdir/usr/share/magnifier/
	cp ./docs/README-EN.rtf $pkgdir/usr/share/magnifier/
	cp ./docs/README-PT.pdf $pkgdir/usr/share/magnifier/
	cp ./docs/README-PT.rtf $pkgdir/usr/share/magnifier/
	mkdir -p $pkgdir/usr/bin
	cp ./magnifier $pkgdir/usr/bin/vmg
}
