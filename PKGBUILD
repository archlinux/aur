# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.21
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('any')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/cloudabi/archive/v$pkgver.tar.gz")
sha512sums=('9af908397aa2dd5b4073b677ca860bce858f69014ad7a4515bb45ee94f8ee477af147afca1a66638550e36e48246d9bbdb354e67de84a09bf36152e8503fed83')

_dir="$pkgname-$pkgver"
package() {
	install -d "$pkgdir/usr/include"
	install -d "$pkgdir/usr/share/licenses/cloudabi"
	install -m 644 -t "$pkgdir/usr/share/licenses/cloudabi" "$srcdir/$_dir/LICENSE"
	install -m 644 -t "$pkgdir/usr/include" "$srcdir/$_dir/headers/"*
}
