# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="jellyfin-autorefresh-new-releases-bin"
_pkgname="jellyfin-autorefresh"
pkgver=0.4.0
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-new-releases"
license=("GPL3")
provides=("jellyfin-autorefresh")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
sha256sums=('fed5c40fb68e59ae40f5cd75e36ab16c27c7ff4ddedd74794daa3c6f56684820')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
