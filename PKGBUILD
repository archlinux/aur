# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>

pkgname=ticker-bin
_pkg=ticker
pkgver=4.5.6
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL3')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
sha256sums_i686=('2809489b86ab864d6a00ab33626df2717a37f1e564a062afb07d3e803c17b2f2')
sha256sums_x86_64=('a10a8d12cd9011ac9a1a039a6c938f574488f647a663718ae5ff929efca170d4')
sha256sums_armv6h=('0fd22b2f4993977820344908ba62600161108db69f4c6436f1382fd8853b890c')
sha256sums_armv7h=('0fd22b2f4993977820344908ba62600161108db69f4c6436f1382fd8853b890c')
sha256sums_aarch64=('dde46023e6a7476f632bbe972610a187b66f1cf46d8cfc7ede86c3cc9ecd9b9e')

package () {
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
