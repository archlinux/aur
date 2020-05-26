# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-fishtape
_reponame=fishtape
pkgver=2.1.3
pkgrel=1
pkgdesc='TAP-based test runner for the fish shell'
arch=(any)
url="https://github.com/jorgebucaran/$_reponame"
license=(MIT)
depends=('fish>=2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bbf481e5bd9c94b2634682718964a2a9b2fea2e247e79fcbfc85a35e46b3d821')

package() {
	cd "$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/etc/fish/functions" fishtape.fish
}
