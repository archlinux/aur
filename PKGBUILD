# Maintainer: Furkan Bekçi (salvoton) <furo@tuta.io>
pkgname=parus
pkgver=1.1.3
pkgrel=1
pkgdesc="A package search TUI for Paru, powered by Skim"
arch=("any")
url="https://github.com/salvoton/parus"
license=("GPL")
depends=("paru" "skim" "bash")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("2d3c4c90d5504a0e28667256cace1d9a70c63786a001d9f3f209cea66b4399b3")

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/parus" "$pkgdir/usr/bin/parus"
}
