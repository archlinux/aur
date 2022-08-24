# Maintainer: rern <rernrern@gmail.com>

pkgname=python-smbus2
pkgver=0.4.2
pkgrel=1
pkgdesc='A drop-in replacement for smbus-cffi/smbus-python'
url="https://github.com/kplindegaard/smbus2"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-setuptools)
source=("https://github.com/kplindegaard/smbus2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b7302a50c032c29661f7edacde6afd3e548a78cd0098dc344a23bbe041fc7c97')

package() {
	cd "$srcdir/smbus2-$pkgver"
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
