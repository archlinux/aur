# Maintainer: Furkan Bekçi (salvoton) <furo@tuta.io>
pkgname=parus
pkgver=1.0.1
pkgrel=1
pkgdesc="A package search tool for Paru using Skim"
arch=("any")
url="https://github.com/salvoton/parus"
license=("GPL")
depends=("paru" "skim" "bash")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("218594b45ba843bddd6945f9bf73206d64221b9b3d8ab5e4b6485a77f2f916a5")

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/parus" "$pkgdir/usr/bin/parus"
}
