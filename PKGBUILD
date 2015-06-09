# Maintainer: Ricardo Leuck <leuck dot r at gmail dot com>
pkgname=frame3dd
pkgver=0.20140514plus
pkgrel=1
pkgdesc="Free open-source software for static and dynamic structural analysis of 2D and 3D frames and trusses."
arch=('i686' 'x86_64')
url="http://frame3dd.sourceforge.net/"
license=('GPL3')
depends=()
optdepends=('gnuplot: plot results')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/0.20140514+/Frame3DD_20140514+_src.zip)
md5sums=('143ae3cc6cec9057be081509148834a7')

build() {
	cd "$srcdir/Frame3DD/src"
	make
}

package() {
	# uncomment the next lines if you want the docs and examples
	# cd "$srcdir/$pkgname-$pkgver"
	# mkdir -p $pkgdir/usr/share/doc/$pkgname
	# cp -r -t $pkgdir/usr/share/doc/$pkgname doc examples

	cd "$srcdir/Frame3DD/src"
	mkdir -p $pkgdir/usr/bin
	cp frame3dd $pkgdir/usr/bin/

}
