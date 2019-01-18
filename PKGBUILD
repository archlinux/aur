# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.4.3
pkgrel=2
pkgdesc="Nazca module for photonic integrated circuit design."
arch=(any)
url="https://nazca-design.org/"
license=("AGPLv3+")
depends=("python" "python-pyclipper" "python-pandas" "python-matplotlib" "python-pillow" "ipython")
sha256sums=('51980706f8e4051d7ed2af9511a28eaf6e05acbcdaa782afb116a26a8509344b')
source=("https://nazca-design.org/dist/$pkg-$pkgver.zip")

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}
