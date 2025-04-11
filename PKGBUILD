# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=runeprice
pkgver=0.2.0
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
sha256sums=('0f60b701badf70cfeb9491250c0d34e6cd6d64b1f7227fbc8801e52e90854d58')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "./$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
