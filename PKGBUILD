# Maintainer: Furkan Bekçi (salvoton) <furo@tuta.io>
pkgname=parus
pkgver=1.0.12
pkgrel=1
pkgdesc="A package search tool for Paru using Skim"
arch=("any")
url="https://github.com/salvoton/parus"
license=("GPL")
depends=("paru" "skim" "bash")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("49f1dcceb1c8580a400fe7e47d60d8387e3dffb1993f63f88b857e6bb62865c2")

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/parus" "$pkgdir/usr/bin/parus"
}
