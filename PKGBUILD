# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=dockcheck
pkgver=0.4.8
pkgrel=3
pkgdesc="CLI tool to automate docker image updates. No pre-pull, selective, notify, prune."
arch=("any")
url="https://github.com/mag37/dockcheck"
license=("GPL-3.0-only")
depends=("bash" "regclient-regctl")
source=("https://github.com/mag37/dockcheck/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("2743b91067e6d183c4bf4a555ef7c1832ad7f8a25f82155a61a1a69bbf8e922b")

package() {
	cd "$pkgname-$pkgver"
	install -D dockcheck.sh $pkgdir/usr/bin/$pkgname
	install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -D notify*.sh -t $pkgdir/usr/share/$pkgname/
}
