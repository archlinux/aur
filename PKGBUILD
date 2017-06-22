# Maintainer: Moritz Luedecke <ritze@skweez.net>
# Contributor: johnLate
pkgname=aspectc++-bin
pkgver=2.2
pkgrel=2
pkgdesc="A set of C++ language extensions to facilitate aspect-oriented programming with C/C++"
arch=('i686' 'x86_64')
url="http://aspectc.org/"
license=('GPL')
depends=('libxml2' 'gcc-libs')
source_i686=('https://www.aspectc.org/releases/2.2/ac-bin-linux-x86-2.2.tar.gz')
source_x86_64=('https://www.aspectc.org/releases/2.2/ac-bin-linux-x86-64bit-2.2.tar.gz')
sha512sums_i686=('06bbbd67cf4ccd847e563fa04fe36f5dcb75472d1fa06181e1d6ae9afbd80972f014cdd9562d99186f4ed82de4956fcb1c1ca96f3aab6b0eb67978da86a3ba81')
sha512sums_x86_64=('cfaf36d2b0c9ede5766abb98f09318a75de4befaff71d725b54bf594d053fca1968ea2227af132dca926f3689693ff9fa31f0e6952d35db9f8a0855cc5403f9d')

_dirname=aspectc++

package() {
	install -dm755 $pkgdir/usr/bin
	install -m755 "$srcdir/$_dirname/ac++" "$pkgdir/usr/bin"
	install -m755 "$srcdir/$_dirname/ag++" "$pkgdir/usr/bin"

	install -dm755 $pkgdir/usr/share/doc/aspectc++
	cp -r "$srcdir/$_dirname/examples" "$pkgdir/usr/share/doc/aspectc++"
	install -dm755 "$pkgdir/usr/share/doc/aspectc++"
}
