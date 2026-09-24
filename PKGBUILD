# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="immich-custom-memories-bin"
_pkgname="immich-custom-memories"
pkgver=0.1.3
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=("GPL3")
provides=("immich-custom-memories")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
sha256sums=('a8f7ff969c822f88d4a908dec54fa6bda6ede1dbb08eb5eb9269b23ddaaa5afb')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
