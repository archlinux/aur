# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.19.p1
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('any')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')

_commit="f40e30c15d139fb8e9957dcaf05904ac51b0ddbb"
source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/cloudabi/archive/$_commit.tar.gz")
sha512sums=('b75125221143efe9eeab51f8dea26ec8b966edf635bd7e63ce83caafbd8ac157d6a302de25fa85133fa4aee0ee27d72f564537961068217ce63df61e96227ee0')

_dir="$pkgname-$_commit"
package() {
	install -d "$pkgdir/usr/include"
	install -d "$pkgdir/usr/share/licenses/cloudabi"
	install -m 644 -t "$pkgdir/usr/share/licenses/cloudabi" "$srcdir/$_dir/LICENSE"
	install -m 644 -t "$pkgdir/usr/include" "$srcdir/$_dir/headers/"*
}
