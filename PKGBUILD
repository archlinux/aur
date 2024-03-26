# Maintainer: Robert Buchberger <robert@buchberger.cc>
pkgname=rbw-menu
pkgver=1.3
pkgrel=1
pkgdesc="GUI Menu for rbw (Unofficial Bitwarden CLI)"
arch=('any')
url="https://github.com/rbuchberger/rbw-menu"
license=('GPL3')
depends=('rbw' 'jq')
optdepends=('wofi: GUI menu')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e101accf4ce296d1e47696a635d28c9caa7fe5bf37b06d4276f812bd73204c53')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/usr/" install
}
