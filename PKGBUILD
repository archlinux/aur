# Maintainer: Robert Buchberger <robert@buchberger.cc>
pkgname=rbw-menu
pkgver=1.0
pkgrel=1
pkgdesc="GUI Menu for rbw (Unofficial Bitwarden CLI)"
arch=('any')
url="https://github.com/rbuchberger/rbw-menu"
license=('GPL3')
depends=('rbw' 'jq')
optdepends=('wofi: GUI menu' 'trurl: TOTP support' 'oath-toolkit: TOTP support')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e764f01ad89363df7d32e8400e65a40b0ca6684b31058ed1db8fda1d560503e')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/usr/" install
}
