# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('0cc591dadd470029ff07e4d760472154437c0672b49f57617109f644536e6b8a032114129ce5d59c170a97fda0114a0a83678e193a643037f1b436788dbbe2d3')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
