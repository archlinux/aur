# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=runeprice
pkgver=1.0.0
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
sha256sums=('e4df5e7a7a1d6c374be5a7505153d3d3de6b7099cd3f220158e9ee0bb2265ee1')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "./$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
