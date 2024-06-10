# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Contributor: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=4.6.3
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
sha256sums_i686=('fb10c67b975c5703f5ee5e9dff558329a262cbc53ce6436e452f6e0bd7d87d35')
sha256sums_x86_64=('35f60dc5a9cdb87337eeb379b8c5cd4be394507dfccc720b3be5d1c8548fd4d6')
sha256sums_armv6h=('cc5dab12c7da7179ca2bf409d4f9e8472b7e6b14117b17511f67cc934a9b2fe4')
sha256sums_armv7h=('cc5dab12c7da7179ca2bf409d4f9e8472b7e6b14117b17511f67cc934a9b2fe4')
sha256sums_aarch64=('2a52cac3cef9896c098848a68fd4037a16e2970df132d350133193113ac3d949')

package () {
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
