# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp-plot
pkgver=1.0.0
pkgrel=1
pkgdesc='Plotting tools for CamillaDSP'
url=https://github.com/HEnquist/pycamilladsp-plot
license=(GPL)
arch=(any)
depends=(python-jsonschema python-matplotlib python-numpy)
makedepends=(python)
source=(https://github.com/HEnquist/pycamilladsp-plot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(ca83ca778f4afc01578f3b5eb97538c2298baaceafe93ac52d41e49f30b01fd6)

package() {
	cd $srcdir/pycamilladsp-plot-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
