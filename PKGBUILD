# Maintainer: Furkan Bekçi (salvoton) <furo@tuta.io>
pkgname=parus
pkgver=1.1.0
pkgrel=1
pkgdesc="A package search tool for Paru using Skim"
arch=("any")
url="https://github.com/salvoton/parus"
license=("GPL")
depends=("paru" "skim" "bash")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("aee595197b739e6bbd88668d3f29027432b5e84e6669430ed0939f1dd3709fb2")

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/parus" "$pkgdir/usr/bin/parus"
}
