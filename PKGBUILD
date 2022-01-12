# Maintainer: rern <rernrern@gmail.com>

pkgname=python-smbus2
pkgver=0.4.1
pkgrel=1
pkgdesc="A drop-in replacement for smbus-cffi/smbus-python"
url="https://github.com/kplindegaard/smbus2"
license=(MIT)
arch=(any)
depends=(python)
source=("https://github.com/kplindegaard/smbus2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('14766329e821427dfad4ca8a3dcb7826592f3a5436f712fc365a9c5673446668')

package() {
	cd "$srcdir/smbus2-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
