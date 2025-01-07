# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=4.8.0
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL3')
depends=('glibc')
provides=("$_pkg")
conflicts=("$_pkg")
options=(!strip)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
sha256sums_i686=('f769cc2574426854b8ab57015c8e0bba98e107c687372ab5406acd9676367d43')
sha256sums_x86_64=('a04fb0458e3a93b026fc577be09645b6095535bfa8f011ddc6a5ec80044d992c')
sha256sums_armv6h=('3bc8e9724193a8b5c160803e723628f0fc249c903796e2d8458978c4040ccda5')
sha256sums_armv7h=('3bc8e9724193a8b5c160803e723628f0fc249c903796e2d8458978c4040ccda5')
sha256sums_aarch64=('d9dcd118af4cf548915ae27566a5548dee31b1096530838281fa9a16d3fcaf6b')

package () {
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
