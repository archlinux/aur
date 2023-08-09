# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp-plot
pkgver=1.0.1
pkgrel=1
pkgdesc='Plotting tools for CamillaDSP'
url=https://github.com/HEnquist/pycamilladsp-plot
license=(GPL)
arch=(any)
depends=(python-jsonschema python-numpy)
makedepends=(python)
source=(https://github.com/HEnquist/pycamilladsp-plot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8c980dc694f3edf2ef9f2e62477fa84cce8a17c1c8f4526906630efae53e78dd')

package() {
	cd $srcdir/pycamilladsp-plot-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
