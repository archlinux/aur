# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>

pkgname=fish-humantime
pkgver=1.0.0
pkgrel=2
pkgdesc='Fish plugin for making timestamps human-readable'
arch=('any')
url="https://github.com/jorgebucaran/humantime.fish"
groups=('fish-plugins')
license=('MIT')
depends=('fish')
makedepends=('git')
replaces=('fish-humanize-duration')
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30')

package() {
	cd "$pkgname"
	install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" functions/humantime.fish
	install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
