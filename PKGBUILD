# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie_rename"
pkgver=1.1.2
pkgrel=2
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie_rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/movie_rename.tar.gz")
b2sums=('51b5fabadf90520f0fbacdd1521a754c34251495b9bec9ae466d7ba1fbabf3ab8c4dc8ed2e3a98727e4b20be1db3a6370dfda1485b6acfbd935896ffe62826d3')
package() {
	# binary
	install -Dm755 ./movie_rename "$pkgdir/usr/local/bin/movie_rename"
	# manpage
	install -Dm644 ./movie_rename.1 "$pkgdir/usr/local/man/man1/movie_rename.1"
}
