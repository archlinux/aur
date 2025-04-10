# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=runeprice
pkgver=0.1.0
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
sha256sums=('fba061b65f074a36a014cccc81553b431ea41d669c76ab730b484664f23b5d4d')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "./$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
