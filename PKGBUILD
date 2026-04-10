# Maintainer: Masaki Waga
# Contributor: Moritz Luedecke <ritze@skweez.net>
# Contributor: johnLate
pkgname=aspectc++-bin
pkgver=2.5
pkgrel=1
pkgdesc="A set of C++ language extensions to facilitate aspect-oriented programming with C/C++"
arch=('i686' 'x86_64')
url="http://aspectc.org/"
license=('GPL')
depends=('libxml2' 'gcc-libs')
source_i686=('https://www.aspectc.org/releases/2.5/ac-bin-linux-x86-2.5.tar.gz')
source_x86_64=('https://www.aspectc.org/releases/2.5/ac-bin-linux-x86-64bit-2.5.tar.gz')
sha512sums_i686=('551924c96390623512a2331b31c601ab23e37a48eee5a97866e5f258556ea4c9ecaacc8a9bec100b27bfd485e26115783f890af4e28b8f03390490ef157b8b87')
sha512sums_x86_64=('e5badaff54c41163ff7fbde57ec1a9efb9a3c4e50849a7ce61da22ca6d3178bc222c9c7393a03001edd0aa8958edafeb82b38aa919b83f8d46dacba51c28f2f5')

_dirname=aspectc++

package() {
	install -dm755 $pkgdir/usr/bin
	install -m755 "$srcdir/$_dirname/ac++" "$pkgdir/usr/bin"
	install -m755 "$srcdir/$_dirname/ag++" "$pkgdir/usr/bin"

	install -dm755 $pkgdir/usr/share/doc/aspectc++
	cp -r "$srcdir/$_dirname/examples" "$pkgdir/usr/share/doc/aspectc++"
	install -dm755 "$pkgdir/usr/share/doc/aspectc++"
}
