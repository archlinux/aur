# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.1.1
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('c00ac9c5ec86b0b5844d24f01c42abe9d4f2a49c8cb17825a9a08c76616170277deb33b714c0c24425bd7e21fa4127864a9c4e4e8b8824c5643ad723d0fade39')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
