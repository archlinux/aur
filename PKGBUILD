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
sha256sums=('553ea3a5377b9a78b98d580527238fd89a5587328597ae738a5f05675475c8c4')

package() {
	cd "$srcdir"
	install -Dm755 forgejo.run "$pkgdir/etc/runit/sv/forgejo/run"
}
