# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('baa7c84161b42aea331437260d38dd081e1ccd0dfb1742f74fc321f447115f09fa8d2f60a01d5664ee7a9b4afb219302105097c4e1544405e6d5959531c52687')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
