# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi
pkgver=0.19
pkgrel=1
pkgdesc="Constants, types and data structures used by CloudABI"
arch=('any')
url='https://github.com/NuxiNL/cloudabi'
license=('BSD')
source=("https://github.com/NuxiNL/cloudabi/archive/v${pkgver}.tar.gz")
sha512sums=('5977aec66e2e6e31dae332966b45f905fdca8dfad6d6d94312dfbde242c0c791a6c201dbe996d9a8aa6f2f9dc7842fa34d7961e19bf096f9500df19399ac4af8')

package() {
	install -d "$pkgdir/usr/include"
	install -d "$pkgdir/usr/share/licenses/cloudabi"
	install -m 644 -t "$pkgdir/usr/share/licenses/cloudabi" "$srcdir/cloudabi-$pkgver/LICENSE"
	install -m 644 -t "$pkgdir/usr/include" "$srcdir/cloudabi-$pkgver/headers/"*
}
