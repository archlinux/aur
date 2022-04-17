# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp-plot
pkgver=0.6.2
pkgrel=1
pkgdesc='Plotting tools for CamillaDSP'
url=https://github.com/HEnquist/pycamilladsp-plot
license=(GPL)
arch=(any)
depends=(python)
makedepends=(python-jsonschema python-matplotlib python-numpy)
source=(https://github.com/HEnquist/pycamilladsp-plot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(9d9dc093f7b19c5888eaff2bbf1cfec91994f2005ae65bfa061da22f66105538)

package() {
	cd $srcdir/pycamilladsp-plot-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
