pkgname=star-charter-git
_pkgname=star-charter
pkgver=4.0
pkgrel=1
pkgdesc="A command-line tool for producing vector-graphics charts of the night sky in SVG, PDF and PNG formats"
url="https://github.com/dcf21/star-charter"
arch=('x86_64')
license=('GPL3')
makedepends=('python-numpy')
depends=()
source=("git+https://github.com/dcf21/star-charter.git")
sha1sums=('SKIP')


build() {
	cd "${srcdir}/${_pkgname}"
	./setup.sh
}

package() {
	mkdir -p "$pkgdir/opt/${_pkgname}"
	cp -r "${srcdir}/${_pkgname}/" "$pkgdir/opt/"
}

