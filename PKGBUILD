# Maintainer: cyber-luna <cyber-luna@tuta.io>

pkgname='llp'
pkgver=0.1
pkgrel=1
pkgdesc="a filesystem pattern locator program"
arch=('any')
url="https://codeberg.org/cyber-luna/llp"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
source=("git+https://codeberg.org/cyber-luna/llp")
sha256sums=('SKIP')

build(){
	cd "$srcdir/$pkgname"
	make 
}

package(){
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
