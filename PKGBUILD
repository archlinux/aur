# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=forgejo-runit
pkgver=20250427
pkgrel=1
pkgdesc="Runit service script for forgejo"
arch=("any")
url="https://forgejo.org"
license=("MIT")
depends=("forgejo" "runit")
source=("forgejo.run")
sha256sums=('d7231545e10dde2db5a6ac1a34a341ef16782bfe9036729a05e5510b23e70aba')

package() {
	cd "$srcdir"
	install -Dm755 forgejo.run "$pkgdir/etc/runit/sv/forgejo/run"
}
