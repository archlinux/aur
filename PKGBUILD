# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Contributor: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=4.5.14
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
sha256sums_i686=('e8364157e02dfa683a97730d433c6c6d600c551835f60d5da0174fc853d7a5f3')
sha256sums_x86_64=('9d1d3d76ebc8ed535b15deb9d27eff0c9d0443021a827365d9fdcdb26868697c')
sha256sums_armv6h=('cfdb094c47d101923152d6eaa7c92f550b1cb30edcbefdcf313e01e40b963277')
sha256sums_armv7h=('cfdb094c47d101923152d6eaa7c92f550b1cb30edcbefdcf313e01e40b963277')
sha256sums_aarch64=('71e67806cede7f8a7b5387e94881c12e673a5a7663ab76d133bf5ceacb7910d7')

package () {
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
