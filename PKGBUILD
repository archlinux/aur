# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgname=dehydrated-pdns-hook
pkgver=0.3.0
pkgrel=1
pkgdesc="PowerDNS api hook for dehydrated"
arch=(any)
url="https://github.com/silkeh/pdns_api.sh"
license=('EUPL v1.2')
source=("https://github.com/silkeh/pdns_api.sh/archive/v$pkgver.tar.gz")
depends=('dehydrated')
sha256sums=('SKIP')
package() {
	cd "pdns_api.sh-$pkgver"
	install -Dm755 "pdns_api.sh" "$pkgdir/etc/dehydrated/hooks/$pkgname.sh"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
