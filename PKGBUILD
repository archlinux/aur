# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="jellyfin-autorefresh-new-releases-bin"
_pkgname="jellyfin-autorefresh"
pkgver=0.4.3
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-new-releases"
license=("GPL3")
provides=("jellyfin-autorefresh")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
sha256sums=('a95324516888b52a1c45fc717465e3d832a1a2ce404e86443ecbe279f54e92cc')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
