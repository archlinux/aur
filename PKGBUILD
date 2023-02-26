# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("pkg.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('901d1db658fd96d563ef55c2fbb7b5a91df13f6cc44d9ac1369a6940a35df24a72c0368f16dff99e980e9059de74c0004d5817cff424bb90d7917cd9f8a11126')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/local/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/local/man/man1/$_pkgname.1"
}
