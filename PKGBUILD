# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-fishtape
_reponame=fishtape
pkgver=3.0.0
pkgrel=1
pkgdesc='TAP-based test runner for the fish shell'
arch=(any)
url="https://github.com/jorgebucaran/$_reponame"
license=(MIT)
depends=('fish>=3.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d79f064882d8b64064f642c90c2877e607e4acbc29d719ba8ae9ca7454fe27ef')

package() {
	cd "$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/etc/fish/functions" functions/fishtape.fish
}
