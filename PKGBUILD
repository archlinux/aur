# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-fishtape
_reponame=fishtape
pkgver=3.0.1
pkgrel=1
pkgdesc='TAP-based test runner for the fish shell'
arch=(any)
url="https://github.com/jorgebucaran/$_reponame"
license=(MIT)
depends=('fish>=3.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1639db39c192d7685458138e526050d662693de93a4985a73a85a818f97c35df')

package() {
	cd "$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/etc/fish/functions" functions/fishtape.fish
}
