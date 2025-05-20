# Maintainer: Furkan Bekçi (salvoton) <furo@tuta.io>
pkgname=parus
pkgver=1.1.2
pkgrel=1
pkgdesc="A package search TUI for Paru using Skim"
arch=("any")
url="https://github.com/salvoton/parus"
license=("GPL")
depends=("paru" "skim" "bash")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("dd6006b5d58c65b4421928b09b2df2cb7a0967d90195c33279b43558e9267e4a")

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/parus" "$pkgdir/usr/bin/parus"
}
