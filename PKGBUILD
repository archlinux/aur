# Maintainer: HampusM (hampusm.business.mail@gmail.com)
pkgname=tic-tac-toe-term
pkgver=1.1
pkgrel=2
pkgdesc="A easy way for you to play Tic-Tac-Toe in any terminal."
arch=(any)
url="https://github.com/Hampusm/$pkgname"
license=('GPL')
depends=('glibc')
source=("git://github.com/Hampusm/$pkgname")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/share/man/man6/"
	make DESTDIR="$pkgdir" install
}
