# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-fishtape
_reponame=fishtape
pkgver=2.1.2
pkgrel=1
pkgdesc='TAP-based test runner for the fish shell'
arch=(any)
url="https://github.com/jorgebucaran/$_reponame"
license=(MIT)
depends=('fish>=2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c8407585c82a87bf3a752bf8b8c1fc85200b8e0b3fc67193dc6dc6ee88170b51')

package() {
	cd "$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/etc/fish/functions" fishtape.fish
}
