# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=runeprice
pkgver=0.5.0
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
sha256sums=('c9b995defbfcfaba15366bc9385849ce1b85e1733782e70181896bf1ffd09d0f')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "./$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
