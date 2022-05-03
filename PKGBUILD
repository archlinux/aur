# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp
pkgver=1.0.0
pkgrel=1
pkgdesc='Communication with CamillaDSP via a websocket'
url=https://github.com/HEnquist/pycamilladsp
license=(GPL)
arch=(any)
depends=(python-websocket-client python-websockets)
makedepends=(python)
source=(https://github.com/HEnquist/pycamilladsp/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(2b77195a4b7402821fb410cd9924ec622124264393ea59e63cfed5344076061c)

package() {
	cd $srcdir/pycamilladsp-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
