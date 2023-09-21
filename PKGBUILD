# Maintainer: Robert Buchberger <robert@buchberger.cc>
pkgname=rbw-menu
pkgver=1.1
pkgrel=1
pkgdesc="GUI Menu for rbw (Unofficial Bitwarden CLI)"
arch=('any')
url="https://github.com/rbuchberger/rbw-menu"
license=('GPL3')
depends=('rbw' 'jq')
optdepends=('wofi: GUI menu')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('305754cad3e3ae1ae23ad1922860bb01e5cf822e43ebe36db0818a0a080e633c')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/usr/" install
}
