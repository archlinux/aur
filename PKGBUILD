# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=fish-humantime
_reponame=humantime.fish
pkgver=1.0.0
pkgrel=1
pkgdesc='Turn milliseconds into a human-readable string in Fish'
arch=(any)
url="https://github.com/jorgebucaran/$_reponame"
license=(MIT)
depends=(fish)
replaces=(fish-humanize-duration)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a042789a4cc1b1eb18bbd47f42fa2b188764a13868956ad32d317d05c87375e8')

package() {
	cd "$srcdir/$_reponame-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/etc/fish/functions" functions/humantime.fish
}
