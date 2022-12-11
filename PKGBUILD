# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('311712935d37ea3805a276dfa63bdbad314185332f6910da089761702482dc0074bf5c82b7c7fbb2d830dfda1d919be7a61cc56b61ace7ccb437784f91c0effa')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
