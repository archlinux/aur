# Maintainer: svenf <sven.frotscher+aur@gmail.com>
pkgname=xcursor-borealis
_pkgname=Borealis-cursors
pkgver=2.0
pkgrel=1
pkgdesc="Cursor theme using a custom color palette inspired by boreal colors."
arch=('any')
url="https://github.com/alvatip/$_pkgname"
license=('GPL3')
source=("$url/releases/download/$pkgver/$_pkgname.tar.gz")
sha256sums=('d317240580fa61122d7eb25e789082ebf338685ea053d08052e1cb76ddcc0183')

package() {
	install -dm755 "$pkgdir"/usr/share/icons/$_pkgname
	cp -r "$srcdir"/{cursors,index.theme} "$pkgdir"/usr/share/icons/$_pkgname
}
