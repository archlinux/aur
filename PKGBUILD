# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.10
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('any')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('c7f467529799cd9258bfd7c8f089417f61fac12a34ea5d8af920504cf5703032971f4b647f001740ab9085eead2c71cfa6aa0fee4a2608c8204a144c65f60ca5')

package() {
	install -d "$pkgdir/usr/include"
	install -d "$pkgdir/usr/share/licenses/cloudabi"
	install -m 644 -t "$pkgdir/usr/share/licenses/cloudabi" "$srcdir/cloudabi-$pkgver/LICENSE"
	install -m 644 -t "$pkgdir/usr/include" "$srcdir/cloudabi-$pkgver/headers/"*
}
