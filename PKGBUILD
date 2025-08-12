# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="jellyfin-autorefresh-new-releases-bin"
_pkgname="jellyfin-autorefresh"
pkgver=0.1.3
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname-new-releases"
license=("GPL3")
provides=("jellyfin-autorefresh")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
sha256sums=('f07d81bcb936aac478b4fd6d6f6ffe8aebd9f8c668097cd1892aa97639bd2185')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
