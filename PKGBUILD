# Maintainer: Robert Buchberger <robert@buchberger.cc>
pkgname=rbw-menu
pkgver=1.2
pkgrel=1
pkgdesc="GUI Menu for rbw (Unofficial Bitwarden CLI)"
arch=('any')
url="https://github.com/rbuchberger/rbw-menu"
license=('GPL3')
depends=('rbw' 'jq')
optdepends=('wofi: GUI menu')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ae79ee5637c9cb95e48bcbfcfe1c4f45fd8a6849d835f77c0ddd026aa140e23')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/usr/" install
}
