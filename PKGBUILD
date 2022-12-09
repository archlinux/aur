# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie_rename"
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple tool to reame movies, written in Rust."
arch=('x86_64')
url='https://github.com/SinTan1729/movie_rename'
license=('GPL3')
provides=('movie_rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/movie_rename.tar.gz")
b2sums=('18c0ac8a75fe8c89248eb6bcf1eb1c25610cd689ffda9bcceed2c1379aab8b3e4f4238818244224849ddd84575f77d8c496ca0eaef987733d21492c71131f03f')
package() {
	# binary
	install -Dm755 ./movie_rename "$pkgdir/usr/local/bin/movie_rename"
	# manpage
	install -Dm644 ./movie_rename.1 "$pkgdir/usr/local/man/man1/movie_rename.1"
}
