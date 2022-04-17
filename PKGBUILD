# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp
pkgver=0.6.0
pkgrel=1
pkgdesc='Communication with CamillaDSP via a websocket'
url=https://github.com/HEnquist/pycamilladsp
license=(GPL)
arch=(any)
depends=(python)
makedepends=(python-websocket-client python-websockets)
source=(https://github.com/HEnquist/pycamilladsp/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(37a749440e17882b5ec8761f45af1ac17f0183752abcfa7849abd917970e124a)

package() {
	cd $srcdir/pycamilladsp-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
