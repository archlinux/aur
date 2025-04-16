# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=runeprice
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool for querying the OSRS Wiki Prices API, written in Bash."
arch=('any')
url="https://github.com/danny-kuehn/$pkgname"
license=('AGPL-3.0-or-later')
depends=('bash'
         'coreutils'
         'curl'
         'jq')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('976bf5607e9dffd1ab33ad309972ce2d49b70ed01cd4f94a246a5e6add95954c')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "./$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
