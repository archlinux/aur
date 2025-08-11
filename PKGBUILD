# Maintainer: Tianhao Wang <i@shrik3.com>
# this PKGBUILD is modified from aspectc++-bin (AUR, Luedecke)
# Contributor: Moritz Luedecke <ritze@skweez.net>
# Contributor: johnLate
pkgname=aspectc++-nightly-bin
pkgver=2.4
pkgrel=2
pkgdesc="Nightly build of AspectC++, a set of C++ language extensions to facilitate aspect-oriented programming with C/C++"
arch=('i686' 'x86_64')
url="http://aspectc.org/"
license=('GPL')
depends=('libxml2' 'gcc-libs')
conflicts=('aspectc++-bin')
source_i686=('https://www.aspectc.org/daily/aspectcpp-linux-daily.tar.gz')
source_x86_64=('https://www.aspectc.org/daily/aspectcpp-linux64-daily.tar.gz')
sha512sums_i686=('SKIP')
sha512sums_x86_64=('SKIP')

_dirname=aspectc++

package() {
	install -dm755 $pkgdir/usr/bin
	install -m755 "$srcdir/$_dirname/ac++" "$pkgdir/usr/bin"
	install -m755 "$srcdir/$_dirname/ag++" "$pkgdir/usr/bin"

	install -dm755 $pkgdir/usr/share/doc/aspectc++
	cp -r "$srcdir/$_dirname/examples" "$pkgdir/usr/share/doc/aspectc++"
	install -dm755 "$pkgdir/usr/share/doc/aspectc++"
}
