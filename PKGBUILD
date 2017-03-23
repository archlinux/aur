# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.11
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('any')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('2b4ea94d46baeb21bde97cf8a7d92fcfda19c2db2c72b763063128a2e23677d5072356a3b43f232c52adbc377bffd751866fb9730e0257729a7ec71b42e402dd')

package() {
	install -d "$pkgdir/usr/include"
	install -d "$pkgdir/usr/share/licenses/cloudabi"
	install -m 644 -t "$pkgdir/usr/share/licenses/cloudabi" "$srcdir/cloudabi-$pkgver/LICENSE"
	install -m 644 -t "$pkgdir/usr/include" "$srcdir/cloudabi-$pkgver/headers/"*
}
