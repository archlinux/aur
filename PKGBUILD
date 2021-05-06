# Maintainer: Moritz Luedecke <ritze@skweez.net>
# Contributor: johnLate
pkgname=aspectc++-bin
pkgver=2.3
pkgrel=1
pkgdesc="A set of C++ language extensions to facilitate aspect-oriented programming with C/C++"
arch=('i686' 'x86_64')
url="http://aspectc.org/"
license=('GPL')
depends=('libxml2' 'gcc-libs')
source_i686=('https://www.aspectc.org/releases/2.3/ac-bin-linux-x86-2.3.tar.gz')
source_x86_64=('https://www.aspectc.org/releases/2.3/ac-bin-linux-x86-64bit-2.3.tar.gz')
sha512sums_i686=('5f7a7c8880f25dd02f915c0dcff5a2ed55d48da0aba3320cc403bfeef413e17a87d6ab4f964a8ea9cb127417d27b137dcd2a2f184e775585ef19d17bfe510a66')
sha512sums_x86_64=('8c3a7f5bbd658f3ebfd5f7cebc2c04afd15cf34fc65c724b9653af7bf432cdbacfb638bde70ac233c7b9dda33f5c1de3f56601899216f6041b1be84aa1d4f437')

_dirname=aspectc++

package() {
	install -dm755 $pkgdir/usr/bin
	install -m755 "$srcdir/$_dirname/ac++" "$pkgdir/usr/bin"
	install -m755 "$srcdir/$_dirname/ag++" "$pkgdir/usr/bin"

	install -dm755 $pkgdir/usr/share/doc/aspectc++
	cp -r "$srcdir/$_dirname/examples" "$pkgdir/usr/share/doc/aspectc++"
	install -dm755 "$pkgdir/usr/share/doc/aspectc++"
}
