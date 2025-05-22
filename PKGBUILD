# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=5.0.3
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
sha256sums_i686=('6d80f98edc5e986bc9d94183c70bd58055fba42a728cf1275466c61c50211e2f')
sha256sums_x86_64=('8a2bdf817a0218a9e04fe82b627780b5647e04e874fb0404e9ce83435829e802')
sha256sums_armv6h=('008f765da29bae6d37769a37f9cd74e895d9e370d538d4dd6ddb9d2e8097f791')
sha256sums_armv7h=('008f765da29bae6d37769a37f9cd74e895d9e370d538d4dd6ddb9d2e8097f791')
sha256sums_aarch64=('7976d142200622da39584088677584b10e98089438f1c7cff2fc075db39f69a4')

package () {
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
