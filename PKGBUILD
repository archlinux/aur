# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-dxfwrite"
pkgver=1.2.1
pkgrel=1
pkgdesc="A Python library to create DXF R12 drawings."
arch=(any)
url="http://dxfwrite.readthedocs.io/"
depends=("python")
sha256sums=('cfe80f77271f7f8b53048c0684ce715e7b94762ccf043ba5f8465bc9da485331')
source=("https://github.com/mozman/dxfwrite/archive/v$pkgver.tar.gz")

package() {
	cd "$srcdir/dxfwrite-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
