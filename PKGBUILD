# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie_rename"
pkgver=1.1.2
pkgrel=3
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie_rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/movie_rename.tar.gz")
b2sums=('45a1df5610effb18bc9d6cd7f180a4854f47360f99f8d63c210325e909655f83367576342baca432b4689f7cf81afb1a349d0bd78cd08a8d44565a709a5dfd56')
package() {
	# binary
	install -Dm755 ./movie_rename "$pkgdir/usr/local/bin/movie_rename"
	# manpage
	install -Dm644 ./movie_rename.1 "$pkgdir/usr/local/man/man1/movie_rename.1"
}
