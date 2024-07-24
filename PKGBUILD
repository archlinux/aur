# Maintainer: cyber-luna <cyber-luna@tuta.io>

pkgname='ldf'
pkgver=0.2.6
pkgrel=1
pkgdesc="report filesystem space info of devices and RAM/swap usage"
arch=('any')
url="https://codeberg.org/cyber-luna/ldf"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
source=("git+https://codeberg.org/cyber-luna/ldf")
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
