# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('a8a1ef2c1638740f5ef9aa72d3b530db24bf3f4a716e21a1b3e03ddf8a6b239ae991223d789d7bdf4cc9fdee1afe1730f86d807dd8db540e14d812e0e38e3495')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
