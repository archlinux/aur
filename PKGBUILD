# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="immich-custom-memories-bin"
_pkgname="immich-custom-memories"
pkgver=0.1.0
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=("GPL3")
provides=("immich-custom-memories")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
sha256sums=('56f5e1a5fc4e0aca89aabd9a0296c592ee7318d6374b21ac10325a6b6c13c542')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
