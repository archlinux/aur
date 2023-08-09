# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp-plot
pkgver=1.0.2
pkgrel=1
pkgdesc='Plotting tools for CamillaDSP'
url=https://github.com/HEnquist/pycamilladsp-plot
license=(GPL)
arch=(any)
depends=(python-jsonschema python-numpy)
makedepends=(python)
source=(https://github.com/HEnquist/pycamilladsp-plot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('1d328d94cf86ab701a9341f263ebcbc10d2f2da702d344d531bc77d99c8ddd97')

package() {
	cd $srcdir/pycamilladsp-plot-$pkgver
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
