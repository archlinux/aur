# Maintainer: Josh Klar <j@iv597.com>
pkgname=projekt
pkgver=0.0.4
pkgrel=1
pkgdesc="Utility for fsharp project files"
arch=('any')
url="http://fsprojects.github.io/Projekt/"
license=('MIT')
depends=('mono')

source=(
	"https://github.com/fsprojects/Projekt/releases/download/0.0.4/Projekt.zip"
	"projekt"
)

sha256sums=(
	'1a275888dc5825b53539e321d3a82a6caac95f3922f299f1194f56206de06565'
	'e1abe3257624cd80ce1016deacfb77326ed8d6f35017a31c6b40700ec754fa3b'
)

package() {
	mkdir -p $pkgdir/usr/lib/projekt
	mkdir -p $pkgdir/usr/bin

	cp -a $srcdir/* $pkgdir/usr/lib/projekt/

	install -m0755 $srcdir/projekt $pkgdir/usr/bin/projekt
}
