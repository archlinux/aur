# Maintainer: Furkan Bekçi (salvoton) <furo@tuta.io>
pkgname=parus
pkgver=1.0.0
pkgrel=1
pkgdesc="A package search tool for Paru using Skim. It can be used to install, upgrade, query and remove packages."
arch=("any")
url="https://github.com/salvoton/parus"
license=("GPL")
depends=("paru" "skim" "bash")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("1462729af8cb0bae83b87b1f0d1d87885c40dea450010d4805d57c0e301c9b0c")

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/parus" "$pkgdir/usr/bin/parus"
}
