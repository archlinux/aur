# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.1.2
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('f88d2b48a1ab628e0ce6d036761e8eba83ba184833b3453e74502053a2970e1e02d2067ef409bc243825e40e304b6a54883c86c6d9e1d473d486492b2aa1c1e2')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
