# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Maintainer: levi (levi0x0)

pkgname=code2html
pkgver=0.9.1
pkgrel=1
pkgdesc="Code2HTML converts a program source code to syntax highlighted HTML"
arch=('any')
url="http://www.palfrader.org/code2html/"
license="custom"
depends=('perl')
source=('http://www.palfrader.org/code/code2html/all/code2html-0.9.1.tar.gz')
md5sums=('368377696547026c79c51a274571dc39')

build() {
	cd "$srcdir/code2html-0.9.1"
	install -D -m755 code2html ${pkgdir}/bin/code2html
	install -D -m644 code2html.1 ${pkgdir}/usr/man/man1
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/code2html/LICENSE
}
